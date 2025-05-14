from langchain.embeddings import HuggingFaceEmbeddings
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.vectorstores import Chroma
from langchain.document_loaders import DirectoryLoader, TextLoader

print(Chroma)

path = "./sql数据全量信息.txt"

with open(path, "r", encoding="utf-8") as f:
    # segments = f.read().split("\n\n")

    for line in f:
        print(line.strip() + 'aaa')