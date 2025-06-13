import os
import torch
from datasets import load_dataset
from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    TrainingArguments,
    Trainer,
    DataCollatorForLanguageModeling
)
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training

# 确保GPU可用
if torch.cuda.is_available():
    print(f"可用GPU: {torch.cuda.get_device_name(0)}")
else:
    print("警告: 未检测到GPU，训练将非常缓慢")

# 模型名称
model_name = "deepseek-ai/deepseek-coder-1.3b-base"  # 请替换为实际的DeepSeek-R1-Distill-Qwen-1.5B模型路径或Hugging Face ID

# 加载模型和分词器
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(
    model_name,
    load_in_4bit=True,  # 使用4位量化以减少内存需求
    torch_dtype=torch.float16,
    device_map="auto",
)

# 准备模型进行4位训练
model = prepare_model_for_kbit_training(model)

# 配置LoRA参数
lora_config = LoraConfig(
    r=16,  # LoRA的秩
    lora_alpha=32,  # LoRA的alpha参数
    target_modules=["q_proj", "k_proj", "v_proj", "o_proj"],  # 针对DeepSeek模型的注意力层
    lora_dropout=0.05,
    bias="none",
    task_type="CAUSAL_LM"
)

# 应用LoRA配置
model = get_peft_model(model, lora_config)

# 加载或创建示例数据集
# 这里使用一个简单的问答数据集作为示例
def load_example_dataset():
    # 示例数据 - 实际应用中应替换为您的训练数据
    data = {
        "instruction": [
            "解释什么是机器学习",
            "如何提高Python编程技能",
            "什么是神经网络",
            "解释Transformer架构"
        ],
        "output": [
            "机器学习是人工智能的一个分支，它使计算机能够从数据中学习而无需明确编程...",
            "提高Python编程技能的方法包括练习编码、阅读优秀代码、学习数据结构和算法...",
            "神经网络是受人类大脑启发的计算系统，由相互连接的节点（神经元）组成...",
            "Transformer架构是一种基于自注意力机制的深度学习模型，广泛应用于NLP任务..."
        ]
    }
    return Dataset.from_dict(data)

# 数据预处理函数
def preprocess_function(examples):
    # 构建格式化的输入文本
    formatted_texts = []
    for instruction, output in zip(examples["instruction"], examples["output"]):
        text = f"### 指令:\n{instruction}\n\n### 回答:\n{output}"
        formatted_texts.append(text)
    
    # 对文本进行编码
    tokenized = tokenizer(
        formatted_texts,
        truncation=True,
        max_length=512,
        padding="max_length",
        return_tensors="pt"
    )
    
    # 对于因果语言模型，标签通常与输入相同
    tokenized["labels"] = tokenized["input_ids"].clone()
    return tokenized

# 加载并处理数据集
dataset = load_example_dataset()
tokenized_dataset = dataset.map(
    preprocess_function,
    batched=True,
    remove_columns=dataset.column_names
)

# 配置训练参数
training_args = TrainingArguments(
    output_dir="./results",
    overwrite_output_dir=True,
    num_train_epochs=3,
    per_device_train_batch_size=4,
    gradient_accumulation_steps=4,
    learning_rate=2e-4,
    weight_decay=0.01,
    warmup_steps=100,
    logging_dir="./logs",
    logging_steps=10,
    save_strategy="epoch",
    fp16=True,  # 使用混合精度训练
)

# 配置数据收集器
data_collator = DataCollatorForLanguageModeling(
    tokenizer=tokenizer,
    mlm=False,  # 对于因果语言模型，设为False
)

# 创建训练器
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset,
    data_collator=data_collator,
)

# 开始训练
print("开始微调模型...")
trainer.train()

# 保存微调后的模型
model_path = "./deepseek-r1-distill-qwen-1.5b-finetuned"
model.save_pretrained(model_path)
tokenizer.save_pretrained(model_path)
print(f"微调后的模型已保存到 {model_path}")

# 示例：如何使用微调后的模型进行推理
def generate_response(model, tokenizer, instruction):
    model.eval()
    input_text = f"### 指令:\n{instruction}\n\n### 回答:\n"
    inputs = tokenizer(input_text, return_tensors="pt").to(model.device)
    
    with torch.no_grad():
        outputs = model.generate(
            **inputs,
            max_new_tokens=100,
            temperature=0.7,
            do_sample=True,
        )
    
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return response.split("### 回答:\n")[-1]

# 测试微调后的模型
test_instruction = "解释什么是量子计算"
response = generate_response(model, tokenizer, test_instruction)
print(f"指令: {test_instruction}")
print(f"回答: {response}")