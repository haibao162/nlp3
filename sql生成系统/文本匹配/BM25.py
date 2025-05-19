import math
from collections import defaultdict
import jieba

class BM25:
    def __init__(self, documents, k1=1.5, b=0.75):
        self.k1 = k1
        self.b = b
        self.documents = documents
        self.doc_len = [len(doc) for doc in documents]
        self.avgdl = sum(self.doc_len) / len(documents)
        self.doc_freqs = self._get_doc_freqs()
        self.idf = self._compute_idf()

    def _get_doc_freqs(self):
        freqs = []
        for doc in self.documents:
            freq = defaultdict(int)
            for word in doc:
                freq[word] += 1
            freqs.append(freq)
        return freqs

    def _compute_idf(self):
        idf = defaultdict(float)
        num_docs = len(self.documents)
        for word in set([word for doc in self.documents for word in doc]):
            df = sum(1 for freq in self.doc_freqs if word in freq)
            idf[word] = math.log((num_docs - df + 0.5) / (df + 0.5) + 1)
        return idf

    def get_scores(self, query):
        scores = []
        for i, doc in enumerate(self.documents):
            score = 0
            doc_freq = self.doc_freqs[i]
            for word in query:
                if word in doc_freq:
                    tf = doc_freq[word]
                    score += (self.idf[word] * tf * (self.k1 + 1) / 
                             (tf + self.k1 * (1 - self.b + self.b * self.doc_len[i] / self.avgdl)))
            scores.append(score)
        return scores
    
if __name__ == "__main__":
    # 使用示例
    documents = [
        ["这", "是", "第一个", "文档"],
        ["这", "是", "文档"],
        ["今天", "天气", "真好"]
    ]
    bm25 = BM25(documents)
    query = ["这", "是", "查询", "文档"]
    scores = bm25.get_scores(query)
    print("BM25得分:", scores)

    col = """线下业务-付款单-付款记录表表名是bf_offline_payment_form_pay_detail，
            字段信息有：corp_id：企业ID，payment_form_id：付款单ID，payment_form_no：付款单号，pay_no：支付单号，
            detail_type：记录类型,1申请支付,2被退回,3被负冲-负冲，data_json：数据json格式，data_json_version：数据json格式版本号，
            update_time：更新时间，update_by：修改人，update_by_name：修改人名字，create_time：创建时间，create_by：创建人，
            create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，version：乐观锁版本号。"""
    cols = list(jieba.cut(col))
    print(cols, '1')

    cols = list(filter(lambda x: (x != '-' and x != '，' and x != '：' and x != '_' and x != ' ' and x != ',' and not x.isnumeric() and x != '。' and 
                                  x != '\n'), cols)) 
    print(cols, '2')
