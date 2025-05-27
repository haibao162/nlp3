from transformers import AutoModelForCausalLM, AutoTokenizer
import torch

model_path = "/Users/mac/Documents/DeepSeek-R1-Distill-Qwen-1.5B"
# DeepSeek-R1-Distill-Qwen-1.5B
model_name = "Qwen/Qwen-1.5B-Chat"
model = AutoModelForCausalLM.from_pretrained(
    model_path,
    torch_dtype=torch.bfloat16,  # 自动选择精度
    trust_remote_code=True,
    device_map="auto", # 自动处理设备分配
)

tokenizer = AutoTokenizer.from_pretrained(
    model_path,
    trust_remote_code=True
)

prompt = "请介绍一下人工智能的发展历程。"
inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
print(inputs, '123')
with torch.no_grad():
    outputs = model(**inputs, max_length=200)

    outputs2 = model.generate(
        **inputs,
        max_length=100,  # 总长度不超过100个token
        temperature=0.7
    )
    

print(outputs[0].shape, 'outputs')
result = torch.argmax(outputs[0], dim=-1)
print(result, 'result')
result = tokenizer.decode(result[0])
print(result, 'result2')


print(outputs2, 'outputs2')

print(tokenizer.decode(torch.LongTensor([151646,  14880, 109432, 104455, 103949, 103168,   1773,  45181, 100022,
         106413, 104532,   3837,  73670, 101118, 101883,  99936,  27442,   3837,
         101912, 105184, 103949,   3837,  29524, 103971,   9370, 108391, 100134,
           3837, 101034,  67949, 100623,  48692, 100168,  99361,   3407,  14880,
         100700,  66394,  15469,   9370, 113228,   3837, 101034,  99558,   9370,
         101911, 102724,   8997,  18493,  53481,  15469, 103920,   3837,  73670,
         103346, 101883, 108247, 103358,  57191, 118296,   3837,  23031, 101138,
         101128,   8997,  14880, 112672,  56568,  31838,  99794,   9370,  15469,
           9370, 113228,   3837, 100630,  99558,   9370, 101911, 102724,  33108,
          99558,   9370, 104036,   8997,  14880, 100700,  66394,  15469,   9370,
         101884, 100178,   3837, 100630, 108247, 101884,  99361,   5373, 107018,
           3837]), skip_special_tokens=True), 'outputs2')




