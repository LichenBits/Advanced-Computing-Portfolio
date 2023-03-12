import random 
import numpy as np 

'''
test random.random(), random.uniform(a,b) and random.gauss(mu, sigma)
'''

def test_covar():
    x = []
    for i in range(10):
        x.append(random.random())
    return x

def test_svd():
    a = np.eye(5)
    b = np.array([[4,0,0], [0,3,0]])
    c = np.array([[1,1],[1,2]])
    u, s, vh = np.linalg.svd(c)

    print(s)
    print(u)
    print(vh)

if __name__ == 'main':
    test_svd()
    test_covar()