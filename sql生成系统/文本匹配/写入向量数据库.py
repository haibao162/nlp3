from loader import load_data
from sentence_transformers import SentenceTransformer, util
from config import Config
# 输入文本最长支持 512 tokens，超长文本需截断或分块处理。
# 第一次会从huggingface下载，存入本地
model_path = Config['model_path']
# all-RoBERTa-Large-v1
model = SentenceTransformer(model_path) # 如果需要区分肯定/否定，需要训练。生成sql语句的话，如果不考虑肯定否定词，可以直接用
# model = SentenceTransformer('shibing624/text2vec-base-chinese')
# 生成句子向量
# emb1 = model.encode("This is a sentence.")
# emb2 = model.encode("This is another sentence.")
# emb1 = model.encode('线下业务-付款单表表名是bf_offline_payment_form，字段信息有：主键id、企业ID、批次号、付款单编号、付款类型,1对公,2对私、申请类型,1常规业务,2垫付退回,3到款退回,4折扣单、业务大类ID、冗余业务大类、业务小类ID、冗余业务小类、请款金额、付款银行名称、付款银行卡号、支付附言、收款银行名称、收款银行卡号、收款方公司ID、收款账户名、收款方公司名称、明细数量、付款单备注、审批单号、提交审批人、提交审批人账号、审批模版id、审批终端,1系统内审批,2钉钉端审批、付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废、状态变更时间、审批备注、状态变更人、状态变更人账号、变更原因、是否需要调整,0否,1是、调整人账号、调整人姓名、调整建议、最新支付号、最新支付备注、最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回、支付中金额、实付(未退回)、实付(被退回)、剩余可支付、已负冲金额、已取消金额、更新时间、修改人、修改人名字、创建时间、创建人、创建人名字、删除状态,0未删除,1已删除、traceId、乐观锁版本号。')
# print(emb1)
emb1 = model.encode("This is a sentence.")
result = ' '.join([str(item) for item in emb1])
# print(emb1)

# 提前将数据库信息写入一个文件里，后续匹配相似度直接读取文件
def writeVector(path):
    db_main_sentences, db_revelant_sentences, db_main_sentences_comment = load_data(path)
    # print(db_main_sentences_comment, 'db_main_sentences_comment')

    with open('sentence.txt', 'a', encoding='utf-8') as file:
        for table_name in db_main_sentences_comment:
            file.write(table_name + " " + db_main_sentences_comment[table_name] + "\n")
    with open('vector.txt', 'a', encoding='utf-8') as file:
        for table_name in db_main_sentences_comment:
            result = ' '.join([str(item) for item in model.encode(db_main_sentences_comment[table_name])])
            file.write(table_name + " " + result + "\n")
            # print(db_main_sentences_comment[table_name])



if __name__ == '__main__':
    path = './database.json'
    writeVector(path)