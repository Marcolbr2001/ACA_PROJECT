import pynq
from pynq import Overlay
import numpy as np

test=Overlay()#inserisci nelle parentesi il percorso del .bit
#se scrivi test? trovi il nome del coso
AXI_ALU=test.setMem_0

from pynq import allocate

#set the input size
v_size=50*1

input_a = pynq.allocate(v_size,np.uint32)
input_b = pynq.allocate(v_size,np.uint32)

op = pynq.allocate(v_size,np.uint32)

output = pynq.allocate(v_size,np.uint32)

#lets see the physical address
input_a.physical_address
input_b.physical_address
op.physical_address
output.physical_address

#lets write some random data
seed = 12345
np.random.seed(seed)
input_a = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
input_b = np.random.randint(low=0, high=255, size=v_size, dtype='uint32')
op = np.random.randint(low=0, high=9, size=v_size, dtype='uint32')

#serve per fare una cosa con la cache, devo richedere al prof.
input_a.flush()
input_b.flush()
op.flush()

#communicate buffer addr
AXI_ALU.register_map

#addr è uno dei valori dei registri che ci aveva fatto vedere il prof, ovviamente sono diversi per i diversi vettori
AXI_ALU.write(a_1,input_a.physical_address)#0x00
AXI_ALU.write(b_1,input_b.physical_address)
AXI_ALU.write(op_1,op.physical_address)
AXI_ALU.write(c_1,output.physical_address)

AXI_ALU.write(0x00,0x1) # Start IP computation: write(control sign, ap_start)

#mettiamo l'interrupt per evitare il polling e verificare l'ap_done

#polling per vedere se ha finito
while AXI_ALU.read(0x00) & 0x4==4:
    pass

output.sync_from_device()

output # Read results