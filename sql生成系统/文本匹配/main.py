from bm25_recall import BM25Recall
from config import Config
from loader import load_data
from sentence_transformers import SentenceTransformer, util
from RAG import getAnswer

vector_path = Config['vector_path']
model_path = Config['model_path']
# all-RoBERTa-Large-v1
model = SentenceTransformer(model_path) # 如果需要区分肯定/否定，需要训练。生成sql语句的话，如果不考虑肯定否定词，可以直接用

def vector_recall(query):
    recall_list = BM25Recall(query)
    # print(recall_list, 'recall_list')
    vector_recall_list = []
    query_vector = model.encode(query)

    with open(vector_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        for line in lines:
            line_list = line.split(' ')
            table_names = line_list[0]
            vector = line_list[1:] # 向量
            vector = [float(item) for item in vector]
            cos_sim = util.cos_sim(query_vector, vector)
            vector_recall_list.append({
                "table_name": table_names,
                "cos_sim": cos_sim.item()
            })
            # print(cos_sim, table_names, 'cos_sim')
            # tensor([[0.7420]]) bf_offline_payment_form cos_sim
            # tensor([[0.7174]]) bf_no_order_advance_payment_form_normal_payment cos_sim
            # tensor([[0.7266]]) bf_no_order_advance_payment_form_payment_apply cos_sim
            # tensor([[0.7288]]) bf_no_order_advance_payment_form_write_off cos_sim
            # tensor([[0.7858]]) bf_offline_payment_form_advance_back_detail cos_sim
            # tensor([[0.6673]]) bf_offline_payment_form_auditor cos_sim
            # tensor([[0.7142]]) bf_offline_payment_form_public_order cos_sim
            # tensor([[0.7356]]) bf_offline_payment_form_pay_detail cos_sim

        # test = lines[0].split(' ')
        # print(test[1:])
    vector_recall_list = sorted(vector_recall_list, key=lambda x:x['cos_sim'], reverse=True)[:5]
    # print(vector_recall_list, 'vector_recall_list') # 最终得到的5张相似度最高的表，用于大模型生成

    path = 'database.json'
    db_main_sentences, db_revelant_sentences, db_main_sentences_comment = load_data(path)

    answer_list = []
    for item in vector_recall_list:
        table_name = item['table_name']
        main_info = db_main_sentences.get(table_name, '') + db_revelant_sentences.get(table_name, '')
        # print(main_info, 'main_info')
        answer_list.append(main_info)
    
    answer = ''.join(answer_list)

    respone = getAnswer(query, answer)
    print(respone)
        


if __name__ == '__main__':
    query = '根据垫款退回-明细中付款单ID等于20230313001，查找付款单银行卡卡号和垫款退回明细中的客户名称'
    vector_recall(query)