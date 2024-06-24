#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pynq
from pynq import Overlay
import numpy as np
from pynq import allocate


# In[2]:


test = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/dec_MIMD/dec_MIMD.bit')


# In[3]:


def golden(a, b, op, res):    
    for i in range(len(op)):        
        match op[i]:
            case 0:
                res[i] = a[i] + 27
            case 1:
                res[i] = b[i] + 27
            case 2:
                res[i] = a[i]*2
            case 3:
                res[i] = b[i]*2
            case 4:
                res[i] = a[i]/2
            case 5:
                res[i] = b[i]/2
            case 6:
                res[i] = a[i] + b[i]
            case 7:
                res[i] = a[i] - b[i]
            case 8:
                res[i] = a[i] * b[i]
            case 9:
                res[i] = a[i]/b[i]
            case _:
                res[i] = 0
    
    return res        


# In[4]:


def eye(res_sw, res_hw):
    for i in range(len(res_sw)):
        if res_sw[i] == res_hw[i]:
            pass
        else:
            print("Something goes WRONG")
            return
        
    print("Results are CORRECT")


# In[5]:


AXI_ALU = test.dec_MIMD_0


# In[6]:


v_size=50


# In[7]:


input_a = pynq.allocate(v_size,np.int32)
input_b = pynq.allocate(v_size,np.int32)

input_op = pynq.allocate(v_size,np.uint32)

output = pynq.allocate(v_size,np.int32)


# In[8]:


#use the seed you need
seed = 12345
#seed = 54321
#seed = 65432

np.random.seed(seed)

data_a = np.random.randint(low=0, high=255, size=v_size, dtype='int32')
data_b = np.random.randint(low=0, high=255, size=v_size, dtype='int32')


# In[9]:


operation = np.random.randint(low=0, high=10, size=v_size, dtype='int32')


# In[10]:


data_a_old = data_a
data_b_old = data_b


# In[11]:


operation_old = operation


# In[12]:


input_a[:] = data_a.flatten()
input_b[:] = data_b.flatten()
input_op[:] = operation.flatten()


# In[13]:


input_a.flush()
input_b.flush()
input_op.flush()


# In[14]:


selec = 2


# In[15]:


output_sw = np.zeros(v_size, dtype=np.int32)

match(selec):
    case 0:
        sw_result = golden(data_a, data_b, operation_old, output_sw)
    case 1:
        sw_result = golden(data_a_old, data_b_old, operation, output_sw)
    case 2:
        sw_result = golden(data_a, data_b, operation, output_sw)
    case 10: 
        sw_result = np.zeros(v_size, 'int32')


# In[16]:


AXI_ALU.write(0x10, input_a.physical_address)   #0x10 address port a1 or a2
AXI_ALU.write(0x1c, input_b.physical_address)   #0x1c address port a1 or b2
AXI_ALU.write(0x34, input_op.physical_address)  #0x34 address port op1 or op2
AXI_ALU.write(0x40, selec)  #0x40 address port selec /0 new data/1 new op/2 new data and op/
AXI_ALU.write(0x28, output.physical_address) #0x28 address port a


# In[17]:


AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)
#polling
while (AXI_ALU.read(0x00) & 0x2) != 2:
        pass


# In[18]:


output.sync_from_device()


# In[19]:


selec = 3 #execution

AXI_ALU.write(0x40, selec)  #0x40 address port selec /0 new data/1 new op/2 new data and op/


# In[20]:


AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)
#polling
while (AXI_ALU.read(0x00) & 0x2) != 2:
        pass


# In[21]:


output.sync_from_device()


# In[22]:


selec = 4 #write back

AXI_ALU.write(0x40, selec)  #0x40 address port selec /0 new data/1 new op/2 new data and op/


# In[23]:


AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)
#polling
while (AXI_ALU.read(0x00) & 0x2) != 2:
        pass


# In[24]:


output.sync_from_device()


# In[25]:


eye(sw_result, output)

