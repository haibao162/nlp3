import torch 
from transformers import AutoTokenizer, AutoModelForCausalLM
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training

model_path = "/Users/mac/Documents/DeepSeek-R1-Distill-Qwen-1.5B"


tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
model = AutoModelForCausalLM.from_pretrained(
    model_path,
    load_in_4bit=True,  # 使用4位量化节省显存
    device_map="auto",
    trust_remote_code=True,
    torch_dtype=torch.bfloat16,
)

print(model.config)