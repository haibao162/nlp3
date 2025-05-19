from datasets import Dataset
import torch 
from transformers import AutoTokenizer, AutoModelForCausalLM
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training

model_path = "/Users/mac/Documents/DeepSeek-R1-Distill-Qwen-1.5B"


ds = Dataset.from_dict({"pokemon": ["bulbasaur", "squirtle"], "type": ["grass", "water"]})
tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
model = AutoModelForCausalLM.from_pretrained(model_path)


print(ds[0])
print(ds[1])

def tokenize_function(examples):
    print(examples, 'exam')
    # return [[1,2]]
    res = tokenizer(examples["pokemon"], padding="max_length", truncation=True)
    # print(res, 'res')
    return res

    
t = ds.map(tokenize_function, batched=True)
# print(t[0])
