#include <stdio.h>
#include <string.h>


// Includes
#include <ap_int.h>
#include <hls_stream.h>

#define DATA_LENGTH 50
#define CONST 27


void reset(hls::stream<int>&ALU_operation, hls::stream<int>&data_a, hls::stream<int>&data_b)
{

	while(!data_a.empty())
		{
			data_a.read();
		}

	while(!data_b.empty())
		{
			data_b.read();
		}

	while(!ALU_operation.empty())
		{
			ALU_operation.read();
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


void load_data_and_op(volatile int a[], volatile int b[], volatile int op[], hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation)
{

	#pragma HLS INLINE

	load_op(op, ALU_operation);
	load_data_a(a, data_a);
	load_data_b(b, data_b);

}


void execute(hls::stream<int>&data_a, hls::stream<int>&data_b, hls::stream<int>&ALU_operation, hls::stream<int>&data_result)
{
	// ----- Doing chosen operation ----- //
	exe: while(!ALU_operation.empty())//for(int i=0; i < DATA_LENGTH; i++)
	{
		#pragma HLS PIPELINE II=1

		switch(ALU_operation.read())
		{

			case 0 : // add costant to data_a
				data_result.write(data_a.read() + CONST);
				data_b.read();
			break;

			case 1 : // add costant to data_b
				data_result.write(data_b.read() + CONST);
				data_a.read();
				break;

			case 2 : // data_a multiplied by 2 (shift rigth)
				data_result.write(data_a.read()*2);
				data_b.read();
			break;

			case 3 : // data_b multiplied by 2 (shift right)
				data_result.write(data_b.read()*2);
				data_a.read();
			break;

			case 4 : // data_a divided by 2 (shift left)
				data_result.write(data_a.read()/2);
				data_b.read();
			break;

			case 5 : // data_b divided by 2 (shift left)
				data_result.write(data_b.read()/2);
				data_a.read();
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
				data_a.read();
				data_b.read();
		}
	}
}

void write_back(hls::stream<int>&data_result, volatile int c[])
{
	int i = 0;
	write_back: while(!data_result.empty())//for(int i = 0; i < DATA_LENGTH; i++)
	{
		#pragma HLS  PIPELINE II=1
		c[i] = data_result.read();
		i++;
	}
}

void ld_exe_wb(volatile int a[], hls::stream<int>&data_a, volatile int b[], hls::stream<int>&data_b, hls::stream<int>&ALU_operation, hls::stream<int>&data_result, volatile int c[])
{
	#pragma HLS DATAFLOW  //per far funzionare il dataflow
	{
		load_data_a(a, data_a);
		load_data_b(b, data_b);
		execute(data_a, data_b, ALU_operation, data_result);
		write_back(data_result, c);
	}
}

void lod_exe_wb(volatile int op[], hls::stream<int>&ALU_operation, volatile int a[], hls::stream<int>&data_a, volatile int b[], hls::stream<int>&data_b, hls::stream<int>&data_result, volatile int c[])
{

	#pragma HLS DATAFLOW  //per far funzionare il dataflow
	{
		load_data_and_op(a, b, op, data_a, data_b, ALU_operation);
		execute(data_a, data_b, ALU_operation, data_result);
		write_back(data_result, c);
	}
}

void alv_MIMD(volatile int* a, volatile int* b, volatile int* c, volatile int* op, int selec) {

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

	//static int ALU_operation_MEM[DATA_LENGTH];

	switch(selec)
	{

		case 0: //LOAD PATTERN

			load_op(op, ALU_operation);

		break;

		case 1: //LOAD DATA, EXECUTE, WB

			ld_exe_wb(a, data_a, b, data_b, ALU_operation, data_result, c);

		break;

		case 2: //LOAD PATTERN, DATA, EXECUTE, WB

			lod_exe_wb(op, ALU_operation, a, data_a, b, data_b, data_result, c);

		break;

		default :

			reset(ALU_operation, data_a, data_b);

	}



}
