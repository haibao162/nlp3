# with open('example.txt', 'a', encoding='utf-8') as file:
#     file.write("这是新的2行内容\n")

a = [1,2,3]
result = ' '.join([str(item) for item in a])
print(result)