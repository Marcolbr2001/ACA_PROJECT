#include <stdio.h>
#include <string.h>

#define DATA_LENGTH 50
#define CONST 27

void selecf(volatile int selec, volatile int a[], volatile int b[], volatile int op[], int data_a[], int data_b[], int ALU_operation[])
{
	switch(selec)
	{
		case 0: //Adding new datas
			for(int i = 0; i < DATA_LENGTH; i++)
				{
					data_a[i] = a[i];
					data_b[i] = b[i];
				}
		break;

		case 1: //Adding new operations
			for(int i = 0; i < DATA_LENGTH; i++)
				{
					ALU_operation[i] = op[i];

				}
		break;

		case 2: //Adding both new operations and new data
			for(int i = 0; i < DATA_LENGTH; i++)
				{
					data_a[i] = a[i];
					data_b[i] = b[i];
					ALU_operation[i] = op[i];
				}
		break;
	}
}

void execute(int data_a[], int data_b[], int ALU_operation[], int data_result[])
{
	// ----- Doing chosen operation ----- //
		for(int i=0; i < DATA_LENGTH; i++)
		{

			switch(ALU_operation[i])
			{

				case 0 : // add costant to data_a
					data_result[i] = data_a[i] + CONST;
				break;

				case 1 : // add costant to data_b
					data_result[i] = data_b[i] + CONST;
				break;

				case 2 : // data_a multiplied by 2 (shift rigth)
					data_result[i] = data_a[i]*2;
				break;

				case 3 : // data_b multiplied by 2 (shift right)
					data_result[i] = data_b[i]*2;
				break;

				case 4 : // data_a divided by 2 (shift left)
					data_result[i] = data_a[i]/2;
				break;

				case 5 : // data_b divided by 2 (shift left)
					data_result[i] = data_b[i]/2;
				break;

				case 6 : // sum
					data_result[i] = data_a[i] + data_b[i];
				break;

				case 7 : // difference
					data_result[i] = data_a[i] - data_b[i];
				break;

				case 8 : // multiplication
					data_result[i] = data_a[i]*data_b[i];
				break;

				case 9 : // data_b divided by 2 (shift left)
					data_result[i] = data_a[i]/data_b[i];
				break;

				/* any other no-operation number  */
				default :
					data_result[i] = 0;
			}
		}
}

void output(int data_result[], volatile int c[])
{
	for(int i = 0; i < DATA_LENGTH; i++)
		c[i] = data_result[i];
}

void dec_MIMD(volatile int* a, volatile int* b, volatile int* c, volatile int* op, volatile int selec) {

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=a
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=b
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=c
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=op
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=selec

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=return

	#pragma HLS INTERFACE mode=m_axi port=a bundle=gmem0 depth=DATA_LENGTH offset=slave
	#pragma HLS INTERFACE mode=m_axi port=b bundle=gmem1 depth=DATA_LENGTH offset=slave
	#pragma HLS INTERFACE mode=m_axi port=c bundle=gmem2 depth=DATA_LENGTH offset=slave
	#pragma HLS INTERFACE mode=m_axi port=op bundle=gmem3 depth=DATA_LENGTH offset=slave


    static int data_a[DATA_LENGTH]; //first operand
	static int data_b[DATA_LENGTH]; //second operand

	int data_result[DATA_LENGTH]; //result

	static int ALU_operation[DATA_LENGTH]; //operation

	selecf(selec, a, b, op, data_a, data_b, ALU_operation);

	execute(data_a, data_b, ALU_operation, data_result);

	output(data_result, c);

}
