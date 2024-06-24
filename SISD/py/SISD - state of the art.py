#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pynq
from pynq import Overlay
import numpy as np
from pynq import allocate
from pynq import PL

import time


# In[2]:


PL.reset()


# In[3]:


test = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/SISD/ALU_sisd.bit')


# In[4]:


AXI_ALU = test.ALU_sisd


# In[5]:


def golden(a, b, op):    
    match op:
        case 1:
            res = a - b
        case 2:
            res = a//b
        case 3:
            res = a*b
        case 0:
            res = a + b
            
    return res 


# In[6]:


a = []
for i in range(10000):
    a.append(np.random.randint(150,255))

b = []
for i in range(10000):
    b.append(np.random.randint(1,150))
    
op = []
for i in range(10000):
    op.append(np.random.randint(0,4))


# In[7]:


time_list = []

compare = []

for j in range(100):
    for i in range(100):

        start = time.time()
        
        AXI_ALU.write(0x10, a[i*j])
        AXI_ALU.write(0x18, b[i*j])
        AXI_ALU.write(0x20, op[i*j])

        c = AXI_ALU.read(0x28)
        
        end = time.time()
        
        res = golden(a[i*j], b[i*j], op[i*j])
        
        if c == res:
            compare.append(1)
        else:
            compare.append(0)
            print(c)
            print(res)
            print(op[i*j])
        
        time_list.append(end-start)

mismatch = 0
for i in compare:
    if i == 0:
        mismatch += 1
        
if mismatch > 0:
    print("There are ", mismatch, " mismatches.")
else:
    print("All results are correct")
    
somma = 0

for i in time_list:
    somma += i
    

print("Total HARDWARE time: ", somma)

