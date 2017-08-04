from __future__ import print_function

import numpy as np
from histogram import histogram1d,histogram2d
from fast_histogram import histogram1d as f_histogram1d
from fast_histogram import histogram2d as f_histogram2d
import time

print("\nProfiling histogram codes:")
print("--------------------------\n")

nsamples = 10000000
bins = 100000

data = np.array(np.random.random(nsamples),np.double)

print("1D histogram...\n")
t = time.time()
s = f_histogram1d(data,bins,(0.1,0.9))
print("Time taken with fast histogram: %f" %(time.time() - t))

t = time.time()
d = histogram1d(data,bins,(0.1,0.9))
print("Time taken by cython histogram: %f" %(time.time() - t))

t = time.time()
dd = np.histogram(data,bins=bins,range=(0.1,0.9))
print("Time taken by numpy: %f " %(time.time() - t))


print("\n\n2D histogram...\n")
bins = (10000,5000)
data1 = np.array(np.random.random(nsamples),np.double)
data2 = np.array(np.random.random(nsamples),np.double)

t = time.time()
s = f_histogram2d(data1,data2,bins,((0.1,0.9),(0.1,0.9)))
print("Time taken by fast_histogram: %f" %(time.time()-t))

t = time.time()
d = histogram2d(data1,data2,bins,((0.1,0.9),(0.1,0.9)))
print("Time taken by cython histogram: %f" %(time.time()-t))

t = time.time()
dd = np.histogram2d(data1,data2,bins,((0.1,0.9),(0.1,0.9)))
print("Time taken by numpy: %f" %(time.time()-t))

