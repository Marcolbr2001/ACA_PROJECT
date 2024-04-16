#importiamo le librerie
import pynq
from pynq import Overlay
from pynq import allocate
import numpy as np
import random
import time

#importiamo il nostro overlay
ol = Overlay('/home/xilinx/pynq/overlays/AXI_ALU/AXI_ALU.bit')

axi_alu_prj = ol.setMem_0

# identify the registers that are used to write the memory address (a, b, op, result)

axi_alu_prj.register_map #NB ricordarsi di sostituire a b op result a riga 35 36 37

data_burst = 50

# alloca dei buffer per i dati
data_a_buffer = allocate(shape=(data_burst,), dtype=np.uint32)
data_b_buffer = allocate(shape=(data_burst,), dtype=np.uint32)
data_op_buffer = allocate(shape=(data_burst,), dtype=np.uint32) # 8 bit
data_result_buffer = allocate(shape=(data_burst,), dtype=np.uint32)

# inserimento dati
data_a_buffer = np.random.randint(1, 100, data_burst)
data_b_buffer = np.random.randint(1, 100, data_burst)
data_op_buffer = np.random.randint(0,  9, data_burst)

axi_alu_prj.register_map.a = data_a_buffer
axi_alu_prj.register_map.b = data_b_buffer
axi_alu_prj.register_map.op = data_op_buffer

# comincia il processo
axi_alu_prj.register_map.CTRL.AP_START=1 

#verifica che l'IP abbia finito
axi_alu_prj.register_map.CTRL.AP_DONE 

# stampa risultati
data_result_buffer 

axi_alu_prj.register_map.CTRL.AUTO_RESTART=1