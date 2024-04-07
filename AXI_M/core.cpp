//#include "core.h"

//int setMem(unsigned char value, unsigned char *addr, int size)
//{
//#pragma HLS INTERFACE mode=m_axi depth=max_depth bundle=MASTER_BUS port=addr offset=slave
//#pragma HLS INTERFACE mode=s_axilite bundle=CTRL_BUS port=size
//#pragma HLS INTERFACE mode=s_axilite bundle=CTRL_BUS port=value


//	if(size < MAX_TRANSFER_SIZE)
//	{
//		for(int idxMemAddr = 0; idxMemAddr < MAX_TRANSFER_SIZE; idxMemAddr++)
//		{
//			#pragma HLS PIPELINE

//			addr[idxMemAddr] = value;


//		}
//		return 0;
//	}
//	else
//	{
//		return -1;
//	}
//}

#include <stdio.h>
#include <string.h>

void setMem(volatile int* a, volatile int* b, volatile int* c, volatile int* op) {

#pragma HLS INTERFACE m_axi port = a depth = 1
#pragma HLS INTERFACE m_axi port = b depth = 1
#pragma HLS INTERFACE m_axi port = c depth = 1

#pragma HLS INTERFACE mode = s_axilite port = op depth = 1


    int i;

    int buff[1]; //first operand
    int buff2[1]; //second operand

    int buff3[1]; //result

    int buff4[1]; //operation

    // memcpy creates a burst access to memory
    // multiple calls of memcpy cannot be pipelined and will be scheduled
    // sequentially memcpy requires a local buffer to store the results of the
    // memory transaction
    memcpy(buff, (const int*)a, 1 * sizeof(int));
    memcpy(buff2, (const int*)b, 1 * sizeof(int));
    memcpy(buff3, (const int*)c, 1 * sizeof(int));
    memcpy(buff4, (const int*)op, 1 * sizeof(int));



    if(buff4[0] == 1)
    {
        buff3[0] = buff[0] + buff2[0];
    }
    else
    {
        buff3[0] = buff[0] - buff2[0];
    }
    

    //memcpy((int*)a, buff, 50 * sizeof(int));
    //memcpy((int*)b, buff2, 50 * sizeof(int));
    memcpy((int*)c, buff3, 1 * sizeof(int));

}
