from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

model_path = "/Users/mac/Documents/DeepSeek-R1-Distill-Qwen-1.5B"
# DeepSeek-R1-Distill-Qwen-1.5B

model = AutoModelForCausalLM.from_pretrained(
    model_path,
    torch_dtype=torch.float16,  # 自动选择精度
    trust_remote_code=True,
    low_cpu_mem_usage=True,     # 优化CPU内存使用
    device_map="auto", # 自动处理设备分配
)

tokenizer = AutoTokenizer.from_pretrained(
    model_path,
    trust_remote_code=True
)

# print(tokenizer('你好')["input_ids"])
# print(tokenizer.encode('你吃饭了吗'))
# # [151646, 108386]
# print(tokenizer.encode('天气'))

# print(tokenizer.decode([151646]))

# output_ids = [151646, 104307]
# decoded_text = tokenizer.decode(output_ids, skip_special_tokens=True)
# print("解码结果:", decoded_text)

print(tokenizer.bos_token_id) # 151646

# output_ids = [151646, 111]
# decoded_text = tokenizer.decode(output_ids, skip_special_tokens=True)
# print("解码结果:", decoded_text)


print(tokenizer.encode('今天天气怎么样'), 'encode今天天气怎么样') # [151646, 100644, 104307, 104472]

text = '你吃饭了吗'
char_tokens = []
for char in text:
    # 对每个字符单独编码
    encoded = tokenizer(char, add_special_tokens=False)
    char_tokens.append(encoded["input_ids"])
# print(char_tokens)
# [[56568], [99405], [99938], [34187], [101037]]
# pred = model(torch.LongTensor([[151646, 56568, 99405, 99938, 34187, 101037]]))
# pred = model(torch.LongTensor([[151646, 100644, 104307, 104472]]))
# inputs = tokenizer('今天天气怎么样', return_tensors="pt").to(model.device)



# model_inputs = tokenizer(['今天天气怎么样'], return_tensors="pt").to(model.device)
# print(model_inputs, 'model_inputs')
# outputs = model.generate(
#         **model_inputs,
#         max_length=100,
#         temperature=0.8,
#         top_p=0.85,
#         top_k=50,
#         pad_token_id=tokenizer.eos_token_id  # 确保有 pad_token
#     )

# # response = tokenizer.decode(outputs[0], skip_special_tokens=True)
# print(outputs, 'response')


# generated_text = tokenizer.decode([151646, 56568, 99405, 99938, 34187, 101037], skip_special_tokens=True)
# print(generated_text, 'generated_text')


# 对于大量文本，逐字处理效率较低，可以批量处理后再映射：
# 批量编码文本
# encoding = tokenizer(text, return_tensors="pt")

# # 模型生成
# outputs = model.generate(**encoding, max_new_tokens=50)

# # 解码并分割成字符
# generated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)
# chars = list(generated_text)

# print("生成的字符列表:", chars)
