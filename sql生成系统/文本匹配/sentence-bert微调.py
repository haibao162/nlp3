# 示例：使用医疗领域数据微调
from sentence_transformers import SentenceTransformer, InputExample, losses
from torch.utils.data import DataLoader

# 针对 “天气好” 和 “天气不好” 语义相反但相似度过高的问题，这是典型的语义极性识别失效场景，可通过以下方法解决

# 准备医疗领域训练数据
train_examples = [
    InputExample(texts=['心肌梗死的典型症状', '心脏病发作的主要表现'], label=4.5),
    InputExample(texts=['高血压患者应控制饮食', '高血压人群需注意饮食调节'], label=4.8),
    # 添加更多医疗领域样本...
    InputExample(texts=['天气好', '天气不好'], label=1.0),
    InputExample(texts=['这个产品很棒', '这个产品很差'], label=1.0),
    InputExample(texts=['我喜欢苹果', '我讨厌苹果'], label=1.0),
    
    # 正-正对（高相似度标签）
    InputExample(texts=['天气晴朗', '天气好'], label=4.5),
    InputExample(texts=['这个产品质量不错', '这个产品很棒'], label=4.8),
    
    # 负-负对（高相似度标签）
    InputExample(texts=['天气糟糕', '天气不好'], label=4.5),
    InputExample(texts=['这个产品有缺陷', '这个产品很差'], label=4.8),
]

# 加载预训练模型
# model = SentenceTransformer('all-RoBERTa-Large-v1')
model = SentenceTransformer("/Users/mac/Documents/my-fine-tuned-all-RoBERTa-Large-v1")


# 定义训练配置
train_dataloader = DataLoader(train_examples, shuffle=True, batch_size=8)
train_loss = losses.CosineSimilarityLoss(model)

# 微调模型
model.fit(
    train_objectives=[(train_dataloader, train_loss)],
    epochs=10,
    warmup_steps=100,
    output_path='finetuned-all-RoBERTa-Large-v1'
)