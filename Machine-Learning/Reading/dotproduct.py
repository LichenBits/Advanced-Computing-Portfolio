import numpy as np

arrX = [1,2,3]
arrY = [1,2,3]
dp = 0 
for i in range(len(arrX)):
    value = arrX[i] * arrY[i]
    dp += value
    
print(dp)