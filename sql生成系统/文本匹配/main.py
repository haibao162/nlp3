from loader import load_data
import jieba
from BM25 import BM25

k = 5 # BM25算法召回的前k个数量

class LoaderData:
    def __init__(self, path):
        self.db_main_sentences = {}
        self.db_revelant_sentences = {}
        self.db_main_list = [] # 用户BM25匹配
        self.load(path)

    def load(self, path):
        db_main_sentences, db_revelant_sentences = load_data(path)
        self.db_main_sentences = db_main_sentences
        self.db_revelant_sentences = db_revelant_sentences
        for (table_name, table_data) in db_main_sentences.items():
            table_data_cut = list(jieba.cut(table_data))
            # 去掉不想关的符号
            table_data_cut = list(filter(lambda x: (x != '-' and x != '，' and x != '：' and x != '_' and x != ' ' and x != ',' and x != '。' and 
                                  x != '\n'), table_data_cut)) 
            self.db_main_list.append({
                "table_name": table_name,
                "table_data_cut": table_data_cut
            })


def compare():
    # 加载数据
    path = './database.json'
    loaders = LoaderData(path)
    db_main_sentences = loaders.db_main_sentences
    db_revelant_sentences = loaders.db_revelant_sentences
    db_main_list = loaders.db_main_list
    documents = [db['table_data_cut'] for db in db_main_list]
    # documents = [
    #     ["这", "是", "第一个", "文档"],
    #     ["这", "是", "文档"],
    #     ["今天", "天气", "真好"]
    # ]
    bm25 = BM25(documents)
    # print(db_main_list[0], 'db_main_list')
    # print(db_main_sentences, 'db_main_sentences')
    # 进行文本匹配
    query = '根据垫款退回-明细中付款单ID等于20230313001，查找付款单银行卡卡号和垫款退回明细中的客户名称'
    query = list(jieba.cut(query))
    query = list(filter(lambda x: (x != '-' and x != '，' and x != '：' and x != '_' and x != ' ' and x != ',' and x != '。'), query))
    # print(documents, 'db_document')
    scores = bm25.get_scores(query)
    print(scores, 'scores')
    db_scores = {}
    for (index, item) in enumerate(db_main_list):
        db_scores[item['table_name']] = scores[index]
    # print(db_scores)
    bm25_recall = sorted(db_scores.items(), key=lambda x: x[1], reverse=True)
    bm25_recall = bm25_recall[0: k]
    vector_sentences = [] # 向量数据库向量
    for (name, score) in bm25_recall:
        vector_sentences.append(db_main_sentences[name])
    print(bm25_recall, 'bm25_recall')
    print(vector_sentences[0])
    
    # print(scores)
    # scores = [get_score(query_cut, item) for item in documents]
    # for item in db_main_list:
    #     table_data_cut = item['table_data_cut']
    #     print()
    

    
    # 输出结果
    # ...

if __name__ == '__main__':
    compare()
