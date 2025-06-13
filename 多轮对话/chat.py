# https://bailian.console.aliyun.com/?tab=model#/api-key

# sk-d6ea04034e9743e8991a7dbb8fe5c11b

# pip install openai -i https://pypi.tuna.tsinghua.edu.cn/simple

import os
from openai import OpenAI


query = """
中国的首都是什么
"""

query = """
中国的首都是什么？中国的首都是北京。那美国呢
"""

answer = """
"""

# 6486

client = OpenAI(
    # 若没有配置环境变量，请用百炼API Key将下行替换为：api_key="sk-xxx",
    api_key= 'sk-d6ea04034e9743e8991a7dbb8fe5c11b' or os.getenv("DASHSCOPE_API_KEY"), # 如何获取API Key：https://help.aliyun.com/zh/model-studio/developer-reference/get-api-key
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1",
)

completion = client.chat.completions.create(
    model="qwen-plus", # 模型列表：https://help.aliyun.com/zh/model-studio/getting-started/models
    messages=[
        {'role': 'user', 'content': query},
        {'role': 'system', 'content': answer }
        ]
)
print(completion.choices[0].message.content)
