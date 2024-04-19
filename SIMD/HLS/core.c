#include <stdio.h>
#include <string.h>

#define DATA_LENGTH 50

void setMem(volatile int* a, volatile int* b, volatile int* c, volatile int op) {

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=op
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=a
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=b
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=c

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=return

	#pragma HLS INTERFACE mode=m_axi port=a bundle=gmem0 depth=DATA_LENGTH offset=slave
	#pragma HLS INTERFACE mode=m_axi port=b bundle=gmem1 depth=DATA_LENGTH offset=slave
	#pragma HLS INTERFACE mode=m_axi port=c bundle=gmem2 depth=DATA_LENGTH offset=slave



    int i;

    int data_a[50]; //first operand
    int data_b[50]; //second operand

    int data_result[50]; //result

    int ALU_operation; //operation


	// ----- Taking Data and operation ------------------ //
	for(int i = 0; i < DATA_LENGTH; i++)
	{
		data_a[i] = a[i];
		data_b[i] = b[i];
	}

		ALU_operation=op;

	// ----- Doing chosen operation ----- //
    for(int i=0; i < DATA_LENGTH; i++)
	{

		if(ALU_operation==1)

				data_result[i] = data_a[i] + data_b[i];

		else

				data_result[i] = data_a[i] - data_b[i];



	}


    // ----- Outputting results -------- //
	for(int i = 0; i < DATA_LENGTH; i++)
	{
		c[i] = data_result[i];
	}

}
