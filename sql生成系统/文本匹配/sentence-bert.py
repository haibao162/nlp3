from sentence_transformers import SentenceTransformer, util
# 输入文本最长支持 512 tokens，超长文本需截断或分块处理。

# 第一次会从huggingface下载，存入本地
model = SentenceTransformer('shibing624/text2vec-base-chinese')
# 生成句子向量
emb1 = model.encode("This is a sentence.")
emb2 = model.encode("This is another sentence.")

emb1 = model.encode("根据垫款退回-明细中付款单ID等于20230313001，查找付款单银行卡卡号和垫款退回明细中的客户名称")
emb2 = model.encode("今天天气晴朗")
emb3 = model.encode("今天天气阴沉")
emb2 = model.encode("线下业务-付款单-垫款退回-明细表，字段信息有：主键id、企业ID、付款单ID、付款单支付方式,1普通支付,2被负冲,3负冲、垫款单编号、项目ID、项目名称、客户ID、客户名称、垫款退回金额、最新支付号、最新支付备注、最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回、支付状态原因、支付状态时间、更新时间、修改人、修改人名字、创建时间、创建人、创建人名字、删除状态,0未删除,1已删除、traceId、乐观锁版本号。")
emb3 = model.encode("线下业务-付款单表，字段信息有：主键id、企业ID、批次号、付款单编号、付款类型,1对公,2对私、申请类型,1常规业务,2垫付退回,3到款退回,4折扣单、业务大类ID、冗余业务大类、业务小类ID、冗余业务小类、请款金额、付款银行名称、付款银行卡号、支付附言、收款银行名称、收款银行卡号、收款方公司ID、收款账户名、收款方公司名称、明细数量、付款单备注、审批单号、提交审批人、提交审批人账号、审批模版id、审批终端,1系统内审批,2钉钉端审批、付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废、状态变更时间、审批备注、状态变更人、状态变更人账号、变更原因、是否需要调整,0否,1是、调整人账号、调整人姓名、调整建议、最新支付号、最新支付备注、最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回、支付中金额、实付(未退回)、实付(被退回)、剩余可支付、已负冲金额、已取消金额、更新时间、修改人、修改人名字、创建时间、创建人、创建人名字、删除状态,0未删除,1已删除、traceId、乐观锁版本号。")

emb4 = model.encode("线下业务-付款单-审批单的当前审批人表，字段信息有：主键id、企业ID、付款单ID、付款单编号、审批单号、当前审批人ID、当前审批人、当前审批人账号、更新时间、修改人、修改人名字、创建时间、创建人、创建人名字、删除状态,0未删除,1已删除、traceId、乐观锁版本号。")

# emb1 = model.encode('天气好')
# emb2 = model.encode('天气不好')
# emb3 = model.encode('今天天气阴沉')
# emb4 = model.encode('今天天气晴朗')


# 计算余弦相似度
cos_sim = util.cos_sim(emb1, emb2)
print(f"Cosine similarity: {cos_sim}")
cos_sim = util.cos_sim(emb1, emb3)
print(f"Cosine similarity: {cos_sim}")
cos_sim = util.cos_sim(emb1, emb4).item()
print(f"Cosine similarity: {cos_sim}")
print(emb1.shape, 'emb1')

model.save('shibing624/text2vec-base-chinese') # 保存到本地
