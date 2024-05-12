#include <stdio.h>
#include <string.h>

#include "hls_stream.h"

#define DATA_LENGTH 50
#define CONST 27


void reset(volatile int c[], hls::stream<int>&data_a, hls::stream<int>&data_b)
{
	reset: for(int i = 0; i < DATA_LENGTH; i++)
	{
		c[i]	 	= 0;
		data_a.write(0);
		data_b.write(0);
	}
}


void load_data(volatile int a[], volatile int b[], hls::stream<int>&data_a, hls::stream<int>&data_b)
{
	l_data: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_a = a[i];
		data_a.write(tmp_a);

		int tmp_b = a[i];
		data_b.write(tmp_b);
		
		//data_a[i] = a[i]; they are no more arrays
		//data_b[i] = b[i];
	}
}



void load_op(volatile int op[], hls::stream<int>&ALU_operation)
{
	l_operation: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_op = op[i];
		ALU_operation.write(tmp_op);
		
		//ALU_operation[i] = op[i];
	}
}


void load_data_and_op(volatile int a[], volatile int b[], volatile int op[], hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation)
{
	l_data_and_operation: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_a = a[i];
		data_a.write(tmp_a);

		int tmp_b = a[i];
		data_b.write(tmp_b);

		int tmp_op = op[i];
		ALU_operation.write(tmp_op);
	}
	
	/*
	#pragma HLS DATAFLOW

	load_op(op, ALU_operation);
	load_data(a, b, data_a, data_b);
	*/
}


void execute(hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation, hls::stream<int>&data_result)
{
	// ----- Doing chosen operation ----- //
	exe: for(int i=0; i < DATA_LENGTH; i++)
	{
		#pragma HLS PIPELINE II=1

		switch(ALU_operation.read())
		{

			case 0 : // add costant to data_a
				data_result.write(data_a.read() + CONST);
			break;

			case 1 : // add costant to data_b
				data_result.write(data_b.read() + CONST);
			break;

			case 2 : // data_a multiplied by 2 (shift rigth)
				data_result.write(data_a.read()*2);
			break;

			case 3 : // data_b multiplied by 2 (shift right)
				data_result.write(data_b.read()*2);
			break;

			case 4 : // data_a divided by 2 (shift left)
				data_result.write(data_a.read()/2);
			break;

			case 5 : // data_b divided by 2 (shift left)
				data_result.write(data_b.read()/2);
			break;

			case 6 : // sum
				data_result.write(data_a.read() + data_b.read());
			break;

			case 7 : // difference
				data_result.write(data_a.read() - data_b.read());
			break;

			case 8 : // multiplication
				data_result.write(data_a.read()*data_b.read());
			break;

			case 9 : // data_b divided by 2 (shift left)
				data_result.write(data_a.read()/data_b.read());
			break;

			/* any other no-operation number  */
			default :
				data_result.write(0);
		}
	}
}

void output(hls::stream<int>&data_result, volatile int c[])
{
	output: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1
		c[i] = data_result.read();
	}
}

void alv_MIMD(volatile int* a, volatile int* b, volatile int* c, volatile int* op, volatile int selec) {

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

	hls::stream<int>data_a; //first operand
    hls::stream<int>data_b; //second operand

    hls::stream<int>data_result; //result

    hls::stream<int>ALU_operation; //operation


	switch(selec)
	{

		case 0: //LOAD PATTERN

			#pragma HLS DATAFLOW

			load_op(op, ALU_operation);

		break;

		case 1: //LOAD DATA AND EXECUTE

			#pragma HLS DATAFLOW

			load_data(a, b, data_a, data_b);
			execute(data_a, data_b, ALU_operation, data_result);
			output(data_result, c);

		break;

		case 2: //LOAD PATTERN, THEN DATA THEN EXECUTE

			#pragma HLS DATAFLOW

			load_data_and_op(a, b, op, data_a, data_b, ALU_operation);
			execute(data_a, data_b, ALU_operation, data_result);
			output(data_result, c);
		break;

		default :

			#pragma HLS DATAFLOW

			reset(c, data_a, data_b);

	}



}
