#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pynq
from pynq import Overlay
import numpy as np
from pynq import allocate


# In[2]:


test = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/MIMD/MIMD.bit')


# In[3]:


AXI_ALU = test.setMem_0


# In[4]:


v_size=50


# In[5]:


input_a = pynq.allocate(v_size,np.int32)
input_b = pynq.allocate(v_size,np.int32)

input_op = pynq.allocate(v_size,np.uint32)

output = pynq.allocate(v_size,np.int32)


# In[6]:


seed = 12345
np.random.seed(seed)
data_a = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
data_b = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
operation = np.random.randint(low=0, high=9, size=v_size, dtype='uint32')


# In[7]:


data_a


# In[8]:


data_b


# In[9]:


operation


# In[10]:


input_a[:] = data_a.flatten()
input_a


# In[11]:


input_b[:] = data_b.flatten()
input_b


# In[12]:


input_op[:] = operation.flatten()
input_op


# In[13]:


input_a.flush()
input_b.flush()
input_op.flush()


# In[14]:


output


# In[15]:


AXI_ALU.read(0x10)


# In[16]:


AXI_ALU.write(0x10, input_a.physical_address)   #0x10 address port a
AXI_ALU.write(0x1c, input_b.physical_address)   #0x1c address port a
AXI_ALU.write(0x34, input_op.physical_address)  #0x34 address port a
AXI_ALU.write(0x28, output.physical_address) #0x28 address port a


# In[17]:


AXI_ALU.read(0x10)


# In[18]:


AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)


# In[19]:


#polling
#while AXI_ALU.read(0x00) & 0x4==4:
#    pass


# In[20]:


output.sync_from_device()


# In[21]:


output # Read results


# In[ ]:




