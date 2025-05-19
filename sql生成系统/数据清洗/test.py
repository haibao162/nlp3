import re
text = "Python is a powerful `create`programming`create2` language"
# match = re.match(r'Python', text)
# print(match)
match = re.finditer(r'`[^`]+`', text)
print(match)
for i in match:
    print(i, '匹配的内容', i.span(), i.group(0))

match = re.search(r'`[^`]+`', text)
print(match.group(0).replace('`', ''))

text = "`corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID'"
match = re.finditer(r'`(.)+`(.)+COMMENT \'(.)+\'', text)
# `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID'
res = re.search(r'`(.)+`', text)
print(res.group(0), 'rrr')
res = re.search(r'\'(.)+\'', text)
print(res.group(0), 'rrr222')


for i in match:
    print(i, '匹配的内容xxx', i.span(), i.group(0))

table = 'CREATE TABLE `bf_no_order_advance_payment_form_normal_payment` ('
createTable = re.search(r'CREATE TABLE `(.)+`', table)
print(createTable.group(0))

table = ") ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='无订单垫付-付款单-无订单常规请款缴费-明细';"
table = ") ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='无订单垫付-付款单-无订单常规请款缴费-明细';"
comment = re.search(r'COMMENT=\'(.)+\'', table)
print(comment, 'search comment')

comment = re.finditer(r'`(.)+`(.)+COMMENT \'(.)+\'', table)
match = list(comment)
print(len(match), comment)

a = [{"x": 1}, {"y": 4}]
my_dict = {'banana': 3, 'apple': 1, 'pear': 2}
for k in my_dict.items():
    print(k[0])
    # print(list(k.keys())[0])





    




