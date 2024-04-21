#include <stdio.h>

#define DATA_LENGTH 50
#define DATA_LENGTH_GROUP 10

void dec_MIMD(volatile int* a, volatile int* b, volatile int* c, volatile int* op, volatile int group);

int main() {

    int DATA_A[DATA_LENGTH];
	int DATA_B[DATA_LENGTH];
	int DATA_RESULT[DATA_LENGTH_GROUP];
	int ALU_OPERATION[DATA_LENGTH_GROUP];
	int GROUP_OP;

    printf("\n\n");

    // Put data into variables
    for (int i = 0; i < DATA_LENGTH; i++)
    {
    	DATA_A[i] = 2*i;
    	DATA_B[i] = i;
	}

    // selecting operations

	for (int i = 0; i < DATA_LENGTH_GROUP; i++)
	{
		DATA_RESULT[i] = 0;
		ALU_OPERATION[i] = i;
	}

	// selecting group

	GROUP_OP=4;

    // ------------------ Go ------------------- //

    // Call the hardware functions

	dec_MIMD(DATA_A, DATA_B, DATA_RESULT, ALU_OPERATION,GROUP_OP);

    //print results
    for (int i = 0; i < DATA_LENGTH_GROUP; i++)
	{
    	printf("A = %d B = %d RES = %d, OP = %d, GROUP = %d \n", DATA_A[i+GROUP_OP*DATA_LENGTH_GROUP], DATA_B[i+GROUP_OP*DATA_LENGTH_GROUP], DATA_RESULT[i], ALU_OPERATION[i], GROUP_OP);
    }

    printf("\n\n");
    // ----------------------------------------- //


    return 0;
}
