#include <stdio.h>
#include <string.h>

#define DATA_LENGTH 50

void setMem(volatile int* a, volatile int* b, volatile int* c, int op) {

#pragma HLS INTERFACE mode=s_axilite bundle=control port=op
#pragma HLS INTERFACE mode=s_axilite bundle=control port=a
#pragma HLS INTERFACE mode=s_axilite bundle=control port=b
#pragma HLS INTERFACE mode=s_axilite bundle=control port=c

#pragma HLS INTERFACE mode=s_axilite bundle=control port=return

#pragma HLS INTERFACE mode=m_axi port=a bundle=gmem0 depth=DATA_LENGTH offset=slave
#pragma HLS INTERFACE mode=m_axi port=b bundle=gmem1 depth=DATA_LENGTH offset=slave
#pragma HLS INTERFACE mode=m_axi port=c bundle=gmem2 depth=DATA_LENGTH offset=slave


    int i;

    int buff[DATA_LENGTH]; //first operand
	int buff2[DATA_LENGTH]; //second operand

	int buff3[DATA_LENGTH]; //result

	int buff4; //operation

    memcpy(buff, (const int*)a, DATA_LENGTH * sizeof(int));
    memcpy(buff2, (const int*)b, DATA_LENGTH * sizeof(int));
    memcpy(buff3, (const int*)c, DATA_LENGTH * sizeof(int));

    for(int i=0; i < DATA_LENGTH; i++)
	{

		if(op == 1)
		{
			buff3[i] = buff[i] + buff2[i];
		}
		else
		{
			buff3[i] = buff[i] - buff2[i];
		}
	}
    
    memcpy((int*)c, buff3, DATA_LENGTH * sizeof(int));

}
