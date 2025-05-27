
from transformers import BertTokenizer, BertModel
import torch

tokenizer = BertTokenizer.from_pretrained(r"/Users/mac/Documents/bert-base-chinese")
model = BertModel.from_pretrained(r"/Users/mac/Documents/bert-base-chinese", return_dict=False)

string1 = "今天天气怎么样"

encoding = tokenizer.encode(string1)
print(encoding, 'encode')
decoding = tokenizer.decode(encoding)
print(decoding, 'decoding')

x = torch.LongTensor([[101, 791, 1921, 1921, 3698, 2582, 720, 3416, 102]])
pred, _ = model(x)
print(pred, pred.shape, 'pred')
pred = torch.argmax(pred, dim=-1)
print(pred, '11')
y = tokenizer.decode(pred[0])
y = tokenizer.decode([294, 405, 614, 581, 655, 743, 259, 351, 294])
print(y, 'yyy')

print(tokenizer.encode("ᄇ ① ナ れ ㄏ 买 я ⁄ ᄇ")) # [101, 294, 405, 614, 581, 655, 743, 259, 351, 294, 102]

