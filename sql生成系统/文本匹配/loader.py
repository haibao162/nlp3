import json
from relevant_graph import table_map

# 数据库信息如下：Comment表表名是SignTable，表SignTable字段信息：isSign：是否签约，1：签约，0：未签约，id：用户id。
# 表SignTable和表Username关联字段有：SignTable.id=Username.userId，
# Comment表表名是SignTable，表Username字段信息：userId: 用户id，name：用户名称。

def getTableInfo(table_name, table_data):
    result = ''
    db_info = table_data['table_comment'] + '表表名是' + table_name + '，' + '字段信息有：'
    column_info = []
    for field in table_data['columns']:
        field_name = list(field.keys())[0]
        field_data = list(field.values())[0]
        column_info.append(field_name + '：' + field_data)
    result = db_info + '，'.join(column_info) + '。'
    return result


def load_data(path):
    # 加载数据
    data = ''
    db_main_sentences = {} # 单独记录每张表里面有哪些字段，用于BM25、向量数据库匹配
    db_revelant_sentences = {} # 单独记录表和其它表的关联关系

    db_tables = []
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    # print(data.items())
    for (table_name, table_data) in data.items():
        result = getTableInfo(table_name, table_data)
        db_main_sentences[table_name] = result
        db_tables.append(table_name)
        # 线下业务-付款单-付款记录表表名是bf_offline_payment_form_pay_detail，字段信息有：
        # corp_id：企业ID，payment_form_id：付款单ID，payment_form_no：付款单号，pay_no：支付单号，
        # detail_type：记录类型,1申请支付,2被退回,3被负冲-负冲，data_json：数据json格式，
        # data_json_version：数据json格式版本号，update_time：更新时间，update_by：修改人，
        # update_by_name：修改人名字，create_time：创建时间，create_by：创建人，
        # create_by_name：创建人名字，is_deleted：删除状态,0未删除,1已删除，
        # trace_id：traceId，version：乐观锁版本号。
        # print(table_name, table_data)
    
    # print(db_sentences, 'table_map')
    # db_sentences：存放了所有表的信息
    for (index, info) in enumerate(db_tables):
        current_table_name = info
        # 表是否很其它表有关联，列出关联关系
        if table_map[current_table_name] and table_map[current_table_name]['join']:
            # print(table_map[current_table_name])
            relevant_list = []
            for join in table_map[current_table_name]['join']:
                # "bf_offline_payment_form.id = bf_no_order_advance_payment_form_normal_payment.payment_form_id",
                [main_table, relevant_table] = join.split("=")
                main_table = main_table.strip()
                relevant_table = relevant_table.strip()
                # print(main_table, relevant_table)
                main_table_name = main_table.split(".")[0]
                relevant_table_name = relevant_table.split(".")[0]
                relevant_item = '表' + main_table_name + '和表' + relevant_table_name + '关联字段有：' + join + '，'
                relevant_item = relevant_item + db_main_sentences[relevant_table_name] # 加上从表的字段信息
                relevant_list.append(relevant_item)
            db_revelant_sentences[main_table_name] = ''.join(relevant_list)
            # print(db_sentences, 'db_sentences relevant_list')
    
    # for (table_name, table_data) in db_main_sentences.items():
    #     print(table_name, table_data)
    # 返回所有表的信息
    return db_main_sentences, db_revelant_sentences


if __name__ == '__main__':
    path = './database.json'
    load_data(path)