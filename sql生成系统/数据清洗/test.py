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
    




