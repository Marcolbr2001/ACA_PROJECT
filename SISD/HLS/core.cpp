#include <stdio.h>
#include <string.h>

#define DATA_LENGTH 50

int sisd(volatile int a, volatile int b, volatile int op) {

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=op
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=a
	#pragma HLS INTERFACE mode=s_axilite bundle=control port=b

	#pragma HLS INTERFACE mode=s_axilite bundle=control port=return

    int data_a; //first operand
    int data_b; //second operand

    int data_result; //result

    int ALU_operation; //operation


	// ----- Taking Data and operation ------------------ //

		data_a = a;
		data_b = b;

		ALU_operation=op;

	// ----- Doing chosen operation ----- //


		if(ALU_operation==0)

				data_result = data_a + data_b;

		else if (ALU_operation==1)

				data_result  = data_a - data_b;

		else if (ALU_operation==3)

				data_result  = data_a  * data_b ;

		else if (ALU_operation==2)

				data_result  = data_a  / data_b ;



    // ----- Outputting results -------- //

		return data_result ;


}
