import torch
import re

path = './数据清洗.txt'

def clean_data(path):
    result = []
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.read()
        segments = lines.split('\n\n')
        print(segments)
        # 处理一张表
        for segment in segments:
            if segment == '':
                continue
                # print(segment)
                # re.search(r'powerful', text)
            columnName = [] # 处理列名
            tableName = [] # 处理表名
            for text in segment.split('\n'):
                createTable = re.search(r'CREATE TABLE `[^`]+`', text)
                if createTable is not None:
                    tableName.append(createTable.group(0).replace('`', ''))
                else:
                    # column = re.search(r'`[^`]+`', text)
                    match = re.finditer(r'`(.)+`(.)+COMMENT \'(.)+\'', text) # 匹配`column_name` xxx COMMENT 'xxx'
                    if match is not None:
                        column = re.search(r'`(.)+`', text)
                        # print(res.group(0), 'rrr')
                        comment = re.search(r'\'(.)+\'', text)



