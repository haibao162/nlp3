from collections import defaultdict
import torch
import re
import json

def clean_data(path):
    result = {}
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.read()
        segments = lines.split('\n\n')
        # print(segments)
        # 处理一张表
        for segment in segments:
            if segment == '':
                continue
            columnList = [] # 处理列名
            tableName = '' # 处理表名
            tableComment = '' # 处理表注释
            for text in segment.split('\n'):
                createTable = re.search(r'CREATE TABLE `[^`]+`', text)
                if createTable != None:
                    createTable = re.search(r'`(.)+`', createTable.group(0))
                    tableName = createTable.group(0).replace('`', '')
                else:
                    match = re.finditer(r'`(.)+`(.)+COMMENT \'(.)+\'', text) # 匹配`column_name` xxx COMMENT 'xxx'
                    if len(list(match)):
                        column = re.search(r'`(.)+`', text)
                        comment = re.search(r'COMMENT \'(.)+\'', text)
                        if column is not None and comment is not None:
                            column = column.group(0).replace('`', '')
                            comment = comment.group(0).replace('COMMENT ', '').replace('\'', '')
                            columnList.append({
                                column: comment
                            })
                    else:
                        tableComment = re.search(r'COMMENT=\'(.)+\';', text)
                        if tableComment != None:
                            tableComment = tableComment.group(0).replace('COMMENT=', '').replace('\'', '').replace(';', '')

            result[tableName] = {}
            result[tableName]['columns'] = columnList
            result[tableName]['tableComment'] = tableComment

    with open('database.json', 'w', encoding='utf-8') as f:
        json.dump(result, f, ensure_ascii=False, indent=2)
        f.close()
    print(result)
            



if __name__ == '__main__':
    path = './数据清洗.sql'
    clean_data(path)