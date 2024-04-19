#!/usr/bin/env python
# coding: utf-8

# In[37]:


import pynq
from pynq import Overlay
import numpy as np
from pynq import allocate


# In[41]:


test = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/AXI_ALU.bit')


# In[44]:


get_ipython().run_line_magic('pinfo', 'test')


# In[45]:


AXI_ALU = test.setMem_0


# In[46]:


v_size=50


# In[47]:


input_a = pynq.allocate(v_size,np.uint32)
input_b = pynq.allocate(v_size,np.uint32)

op = pynq.allocate(v_size,np.uint32)

output = pynq.allocate(v_size,np.uint32)


# In[48]:


addr_a = input_a.physical_address


# In[49]:


addr_b = input_b.physical_address


# In[50]:


addr_op = op.physical_address


# In[51]:


addr_out = output.physical_address


# In[52]:


seed = 12345
np.random.seed(seed)
input_a = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
input_b = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
op = np.random.randint(low=0, high=9, size=v_size, dtype='uint32')


# In[53]:


input_a


# In[54]:


input_b


# In[55]:


op


# In[56]:


AXI_ALU.register_map


# In[57]:


AXI_ALU.write(0x10,addr_a)   #0x10 address port a
AXI_ALU.write(0x1c,addr_b)   #0x1c address port a
AXI_ALU.write(0x34,addr_op)  #0x34 address port a
AXI_ALU.write(0x28,addr_out) #0x28 address port a


# In[58]:


AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)


# In[32]:


#polling
while AXI_ALU.read(0x00) & 0x4==4:
    pass


# In[59]:


output.sync_from_device()


# In[62]:


output # Read results


# In[ ]:




