#include <stdio.h>
#include <string.h>


// Includes
#include <ap_int.h>
#include <hls_stream.h>

#define DATA_LENGTH 50
#define CONST 27


void reset(hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation, int ALU_operation_MEM[])
{

#pragma HLS INLINE

	clear_FIFO_a : while(!data_a.empty())
			{
				int x;
				x=data_a.read();
			}
		clear_FIFO_b : while(!data_b.empty())
			{
				int x;
				x=data_b.read();
			}
		clear_FIFO_op : while(!ALU_operation.empty())
			{
				int x;
				x=ALU_operation.read();
			}
		clear_RAM_op : for(int i = 0; i < DATA_LENGTH; i++)
			{
				ALU_operation_MEM[i] = 0;
			}

}


void load_data_a(volatile int a[], hls::stream<int>&data_a)
{
	l_data_a: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_a = a[i];
		data_a.write(tmp_a);
	}
}

void load_data_b(volatile int b[], hls::stream<int>&data_b)
{
	l_data_b: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_b = b[i];
		data_b.write(tmp_b);

	}
}


void load_op(volatile int op[], hls::stream<int>&ALU_operation)
{

	l_operation: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		int tmp_op = op[i];
		ALU_operation.write(tmp_op);
	}
}

void store_op(hls::stream<int>&ALU_operation, int ALU_operation_MEM[])
{
	s_operation_data_op: for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1

		ALU_operation_MEM[i] = ALU_operation.read();

	}
}


void operation(volatile int op[], hls::stream<int>&ALU_operation,int ALU_operation_MEM[])
{
	load_op(op, ALU_operation);
	store_op(ALU_operation, ALU_operation_MEM);
}




void load_data_and_op(volatile int a[], volatile int b[],volatile int op[], hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation)
{

	#pragma HLS INLINE

	load_op(op, ALU_operation);
	load_data_a(a, data_a);
	load_data_b(b, data_b);

}



void execute(hls::stream<int>&data_a,hls::stream<int>&data_b, int ALU_operation_MEM[], hls::stream<int>&data_result)
{
	// ----- Doing chosen operation ----- //
	exe: for(int i=0; i < DATA_LENGTH; i++)
	{
		#pragma HLS PIPELINE II=1

		int a,b;

		a=data_a.read();
		b=data_b.read();

		switch(ALU_operation_MEM[i])
		{

			case 0 : // add costant to data_a
				data_result.write(a + CONST);
			break;

			case 1 : // add costant to data_b
				data_result.write(b + CONST);
			break;

			case 2 : // data_a multiplied by 2 (shift rigth)
				data_result.write(a*2);

			break;

			case 3 : // data_b multiplied by 2 (shift right)
				data_result.write(b*2);
			break;

			case 4 : // data_a divided by 2 (shift left)
				data_result.write(a/2);
			break;

			case 5 : // data_b divided by 2 (shift left)
				data_result.write(b/2);
			break;

			case 6 : // sum
				data_result.write(a + b);
			break;

			case 7 : // difference
				data_result.write(a - b);
			break;

			case 8 : // multiplication
				data_result.write(a*b);
			break;

			case 9 : // data_b divided by 2 (shift left)
				data_result.write(a/b);
			break;

			/* any other no-operation number  */
			default :
				data_result.write(0);

		}
	}
}

void write_back(hls::stream<int>&data_result, volatile int c[])
{
	write_back: for(int i = 0; i < DATA_LENGTH; i++)//while(!data_result.empty())//
	{
		#pragma HLS  PIPELINE II=1
		c[i] = data_result.read();
	}

}




void data_exe_wb(volatile int a[],volatile int b[], hls::stream<int>&data_a,hls::stream<int>&data_b, int ALU_operation_MEM[], hls::stream<int>&data_result, volatile int c[])
{

	//#pragma HLS DATAFLOW  //per far funzionare il dataflow

		load_data_a(a, data_a);
		load_data_b(b, data_b);
		execute(data_a, data_b, ALU_operation_MEM, data_result);
		write_back(data_result, c);

}

void op_data_exe_wb(volatile int a[],volatile  int b[],volatile int op[],hls::stream<int>&data_a,hls::stream<int>&data_b, hls::stream<int>&ALU_operation,int ALU_operation_MEM[], hls::stream<int>&data_result,volatile int c[])
{

	//#pragma HLS DATAFLOW  //per far funzionare il dataflow

		operation(op,ALU_operation,ALU_operation_MEM);
		load_data_a(a, data_a);
		load_data_b(b, data_b);
		execute(data_a, data_b, ALU_operation_MEM, data_result);
		write_back(data_result, c);

}

void alv_MIMD(volatile int* a,volatile  int* b, volatile int* c,volatile int* op, int selec) {

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

	static hls::stream<int> data_a("data_a");
	#pragma HLS STREAM variable=data_a depth=DATA_LENGTH
	//first operand

	static hls::stream<int> data_b("data_b");
	#pragma HLS STREAM variable=data_b depth=DATA_LENGTH
	 //second operand

	static hls::stream<int> data_result("data_result");
	#pragma HLS STREAM variable=data_result depth=DATA_LENGTH
	 //result

	static hls::stream<int> ALU_operation("ALU_operation");
	#pragma HLS STREAM variable=ALU_operation depth=DATA_LENGTH
	 //operation

	static int ALU_operation_MEM[DATA_LENGTH] = {0};

	#pragma HLS DATAFLOW

	switch(selec)
	{

		case 0: //LOAD PATTERN

			operation(op, ALU_operation, ALU_operation_MEM);

		break;

		case 1: //LOAD DATA, EXECUTE, WB

			data_exe_wb(a, b, data_a, data_b, ALU_operation_MEM, data_result, c);

		break;

		case 2: //LOAD PATTERN, DATA, EXECUTE, WB

			op_data_exe_wb(a, b, op ,data_a, data_b, ALU_operation, ALU_operation_MEM, data_result, c);

		break;

		default :

			reset(data_a, data_b, ALU_operation, ALU_operation_MEM);

	}



}
