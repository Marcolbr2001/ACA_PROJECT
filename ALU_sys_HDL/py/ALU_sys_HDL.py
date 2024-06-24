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


test = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/ALU_sys_HDL/ALU_sys_HDL.bit')


# In[4]:


AXI_ALU = test.ALU_sys_HDL_0


# In[5]:


def golden(a, b, op, res):    
    for i in range(len(op)):        
        match op[i]:
            case 1:
                res[i] = a[i] - b[i]
            case 2:
                res[i] = a[i]/b[i]
            case 3:
                res[i] = a[i]*b[i]
            case _:
                res[i] = a[i] + b[i]
    
    return res 


# In[6]:


# HW and SW function comparison
def eye(res_sw, res_hw):
    for i in range(len(res_sw)):
        if res_sw[i] == res_hw[i]:
            pass
        else:
            return 0

    return 1    


# In[7]:


v_size = 100 # Burst size


# In[8]:


time_list = []
time_list_sw = []
compare_results_list = []

repetition = 10000

for i in range(repetition):
    
    seed = np.random.randint(low=1, high=99999, size=1)

    np.random.seed(seed)

    start_sw = time.time()
    
    # salvare i dati
    data_a = np.random.randint(low=1, high=255, size=v_size, dtype='int32')
    data_b = np.random.randint(low=1, high=255, size=v_size, dtype='int32')

    #salvare le operazioni
    operation = np.random.randint(low=0, high=4, size=v_size, dtype='int32')

    data_a_old = data_a
    data_b_old = data_b

    operation_old = operation
    operation_hw = operation

    # Choose what the hardware has to do
    selec = 2

    # selec = 0      --> Store New Operation
    # selec = 1      --> Load New Data and Execute
    # selec = 2      --> Run Entire Program
    # selec = Others --> Reset

    output_sw = np.zeros(v_size, dtype=np.int32)
    
    # SW function (it represent also the outside)
    match(selec):
        case 0:
            sw_result = golden(data_a_old, data_b_old, operation_old, output_sw)
        case 1:
            sw_result = golden(data_a, data_b, operation_old, output_sw)
        case 2:
            sw_result = golden(data_a, data_b, operation, output_sw)
        case others: 
            sw_result = np.zeros(v_size, 'int32')
        
    end_sw = time.time()

    tempo_sw = end_sw - start_sw

    time_list_sw.append(tempo_sw)

    input_a = pynq.allocate(v_size,np.int32)
    input_b = pynq.allocate(v_size,np.int32)

    input_op = pynq.allocate(v_size,np.uint32)

    output = pynq.allocate(v_size,np.int32)

    input_a[:] = data_a.flatten()
    input_b[:] = data_b.flatten()
    input_op[:] = operation_hw.flatten()

    input_a.flush()
    input_b.flush()
    input_op.flush()

    # Write into registers
    AXI_ALU.write(0x10, input_a.physical_address)   #0x10 address port a1 or a2
    AXI_ALU.write(0x1c, input_b.physical_address)   #0x1c address port a1 or b2
    AXI_ALU.write(0x34, input_op.physical_address)  #0x34 address port op1 or op2
    AXI_ALU.write(0x40, selec)  #0x40 address port selec /0 new data/1 new op/2 new data and op/
    AXI_ALU.write(0x28, output.physical_address) #0x28 address port a

    # IP starts
    AXI_ALU.write(0x00,0x1) # ap_start = 1 --> Start IP computation: write(control sign, ap_start)

    # ---- polling ----- #

    start = time.time()

    while (AXI_ALU.read(0x00) & 0x4) != 4: #0x4 != 4 --> exit when in idle (better) 
            pass                           #0x2 != 2 --> exit when ap_done high 

    end   = time.time()

    # ----------------- #
    
    tot_time = end-start

    time_list.append(tot_time)

    output.sync_from_device()

    # Check if Hardware and Software results are equal
    compare = eye(sw_result, output)

    compare_results_list.append(compare)

    


# In[9]:


mismatch = 0

for i in compare_results_list:
    if i == 0:
        mismatch += 1
        
if mismatch == 0:
    print("Hardware Behaves CORRECTLY")
else:
    print("There are", mismatch, "WRONG computation.")


# In[10]:


time_sum = 0

for i in time_list:
    time_sum += i
    
average_hw = time_sum/len(time_list)

print("HARDWARE average: ", average_hw)


# In[11]:


time_sum = 0
for i in time_list_sw:
    time_sum += i
average_sw = time_sum/len(time_list_sw)

print("SOFTWARE average: ", average_sw)


# In[12]:


print("Speed-Up: ", average_sw/average_hw)


# In[ ]:




