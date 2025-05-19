# https://bailian.console.aliyun.com/?tab=model#/api-key

# sk-d6ea04034e9743e8991a7dbb8fe5c11b

# pip install openai -i https://pypi.tuna.tsinghua.edu.cn/simple

import os
from openai import OpenAI

str = """
根据垫款退回-明细中付款单ID等于20230313001，查找付款单银行卡卡号和垫款退回明细中的客户名称，生成对应的sql语句。数据库信息如下：
bf_offline_payment_form 线下业务-付款单表表名是bf_offline_payment_form，
字段信息有：id：主键id，corp_id：企业ID，batch_no：批次号，payment_form_no：付款单编号，payment_type：付款类型,1对公,2对私，
apply_type：申请类型,1常规业务,2垫付退回,3到款退回,4折扣单，category_parent_id：业务大类ID，category_parent：冗余业务大类，
category_child_id：业务小类ID，category_child：冗余业务小类，amount：请款金额，payer_bank_name：付款银行名称，
payer_bank_no：付款银行卡号，payer_bank_ps：支付附言，payee_bank_name：收款银行名称，payee_bank_no：收款银行卡号，
payee_company_id：收款方公司ID，payee_bank_account_name：收款账户名，payee_company_name：收款方公司名称，
detail_count：明细数量，remark：付款单备注，audit_no：审批单号，apply_audit_by：提交审批人，apply_audit_account：提交审批人账号，
audit_template_id：审批模版id，audit_terminal：审批终端,1系统内审批,2钉钉端审批，
audit_state：付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废，audit_time：状态变更时间，audit_remark：审批备注，
audit_by：状态变更人，audit_by_account：状态变更人账号，audit_reason：变更原因，adjust_enabled：是否需要调整,0否,1是，
adjust_by_account：调整人账号，adjust_by：调整人姓名，adjust_suggest：调整建议，pay_no：最新支付号，pay_remark：最新支付备注，
pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回，
paying_amount：支付中金额，pay_unback_amount：实付(未退回)，pay_back_amount：实付(被退回)，pay_remain_amount：剩余可支付，
pay_negative_amount：已负冲金额，pay_canceled_amount：已取消金额，update_time：更新时间，update_by：修改人，
update_by_name：修改人名字，create_time：创建时间，create_by：创建人，create_by_name：创建人名字，
is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，version：乐观锁版本号。
表bf_offline_payment_form和表bf_no_order_advance_payment_form_normal_payment关联字段有：
bf_offline_payment_form.id = bf_no_order_advance_payment_form_normal_payment.payment_form_id，
无订单垫付-付款单-无订单常规请款缴费-明细表表名是bf_no_order_advance_payment_form_normal_payment，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，form_pay_type：付款单支付方式,1普通支付，
order_type：订单类型,1正常订单，detail_no：明细单号，project_id：项目ID，project_name：项目名称，
customer_id：客户ID，customer_name：客户名称，expenses_parent_id：费用大类ID，expenses_parent：冗余费用大类名称，
expenses_child_id：费用小类ID，expenses_child：冗余费用小类名称，amount：金额，pay_no：最新支付号，
pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消，
pay_time：支付状态时间，pay_state_reason：支付状态原因，update_time：更新时间，update_by：修改人，update_by_name：修改人名字，
create_time：创建时间，create_by：创建人，create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，
version：乐观锁版本号。
表bf_offline_payment_form和表bf_no_order_advance_payment_form_payment_apply关联字段有：
bf_offline_payment_form.id = bf_no_order_advance_payment_form_payment_apply.payment_form_id，
无订单垫付-付款单-无订单垫付请款-明细表表名是bf_no_order_advance_payment_form_payment_apply，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，form_pay_type：付款单支付方式,1普通支付，order_type：订单类型,1正常订单，
detail_no：明细单号，project_id：项目ID，project_name：项目名称，customer_id：客户ID，customer_name：客户名称，
expenses_parent_id：费用大类ID，expenses_parent：冗余费用大类名称，expenses_child_id：费用小类ID，
expenses_child：冗余费用小类名称，amount：金额，pay_no：最新支付号，
pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消，
pay_time：支付状态时间，pay_state_reason：支付状态原因，update_time：更新时间，update_by：修改人，update_by_name：修改人名字，
create_time：创建时间，create_by：创建人，create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，
version：乐观锁版本号。
表bf_offline_payment_form和表bf_no_order_advance_payment_form_write_off关联字段有：
bf_offline_payment_form.id = bf_no_order_advance_payment_form_write_off.payment_form_id，
无订单垫付-付款单-无订单垫付核销费-明细表表名是bf_no_order_advance_payment_form_write_off，字段信息有：corp_id：企业ID，
payment_form_id：付款单ID，form_pay_type：付款单支付方式,1普通支付，order_type：订单类型,1正常订单，detail_no：明细单号，
project_id：项目ID，project_name：项目名称，customer_id：客户ID，customer_name：客户名称，expenses_parent_id：费用大类ID，
expenses_parent：冗余费用大类名称，expenses_child_id：费用小类ID，expenses_child：冗余费用小类名称，amount：金额，
pay_no：最新支付号，pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消，
pay_time：支付状态时间，pay_state_reason：支付状态原因，update_time：更新时间，update_by：修改人，update_by_name：修改人名字，
create_time：创建时间，create_by：创建人，create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，
version：乐观锁版本号。
表bf_offline_payment_form和表bf_offline_payment_form_advance_back_detail关联字段有：
bf_offline_payment_form.id = bf_offline_payment_form_advance_back_detail.payment_form_id，
线下业务-付款单-垫款退回-明细表表名是bf_offline_payment_form_advance_back_detail，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，form_pay_type：付款单支付方式,1普通支付,2被负冲,3负冲，
advance_no：垫款单编号，project_id：项目ID，project_name：项目名称，customer_id：客户ID，customer_name：客户名称，
amount：垫款退回金额，pay_no：最新支付号，pay_remark：最新支付备注，
pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回，
pay_state_reason：支付状态原因，pay_time：支付状态时间，update_time：更新时间，update_by：修改人，update_by_name：修改人名字，
create_time：创建时间，create_by：创建人，create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，
trace_id：traceId，version：乐观锁版本号。
表bf_offline_payment_form和表bf_offline_payment_form_auditor关联字段有：
bf_offline_payment_form.id = bf_offline_payment_form_auditor.payment_form_id，
线下业务-付款单-审批单的当前审批人表表名是bf_offline_payment_form_auditor，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，payment_form_no：付款单编号，
audit_no：审批单号，audit_by_id：当前审批人ID，audit_by：当前审批人，
audit_by_account：当前审批人账号，update_time：更新时间，update_by：修改人，
update_by_name：修改人名字，create_time：创建时间，create_by：创建人，create_by_name：创建人名字，
is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，version：乐观锁版本号。
表bf_offline_payment_form和表bf_offline_payment_form_public_order关联字段有：
bf_offline_payment_form.id = bf_offline_payment_form_public_order.payment_form_id，
线下业务-付款单-对公付款-明细表表名是bf_offline_payment_form_public_order，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，form_pay_type：付款单支付方式,1普通支付,2被负冲,3负冲，
order_type：订单类型,1正常订单,2退款订单，order_child_parent_id：子订单的父亲订单ID，
order_child_parent_no：子订单的父子订单号，order_child_id：子订单ID，order_child_no：子订单号，
project_id：项目ID，project_name：项目名称，customer_id：客户ID，customer_name：客户名称，
expenses_parent_id：费用大类ID，expenses_parent：冗余费用大类名称，expenses_child_id：费用小类ID，
expenses_child：冗余费用小类名称，amount：本次付款金额，pay_no：最新支付号，
pay_state：最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消，
pay_time：支付状态时间，pay_state_reason：支付状态原因，update_time：更新时间，update_by：修改人，update_by_name：修改人名字，
create_time：创建时间，create_by：创建人，create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，
trace_id：traceId，version：乐观锁版本号。
表bf_offline_payment_form和表bf_offline_payment_form_pay_detail关联字段有：
bf_offline_payment_form.id = bf_offline_payment_form_pay_detail.payment_form_id，
线下业务-付款单-付款记录表表名是bf_offline_payment_form_pay_detail，
字段信息有：corp_id：企业ID，payment_form_id：付款单ID，payment_form_no：付款单号，pay_no：支付单号，
detail_type：记录类型,1申请支付,2被退回,3被负冲-负冲，data_json：数据json格式，data_json_version：数据json格式版本号，
update_time：更新时间，update_by：修改人，update_by_name：修改人名字，create_time：创建时间，create_by：创建人，
create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，trace_id：traceId，version：乐观锁版本号。
"""

client = OpenAI(
    # 若没有配置环境变量，请用百炼API Key将下行替换为：api_key="sk-xxx",
    api_key= 'sk-d6ea04034e9743e8991a7dbb8fe5c11b' or os.getenv("DASHSCOPE_API_KEY"), # 如何获取API Key：https://help.aliyun.com/zh/model-studio/developer-reference/get-api-key
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1",
)

completion = client.chat.completions.create(
    model="qwen-plus", # 模型列表：https://help.aliyun.com/zh/model-studio/getting-started/models
    messages=[
        {'role': 'user', 'content': str},
        # {'role': 'user', 'content': '你是谁？'}
        ]
)
print(completion.choices[0].message.content)