//#include <stdio.h>
//#include "core.h"

//unsigned char someMem[204800];
//int main()
//{
//	setMem(55, someMem, 100);
//	for(int idx = 0; idx < 100; idx++)
//	{
//		printf("Value someMem[%d]=%X\n", idx, someMem[idx]);
//	}

//	return 0;
//}

#include <stdio.h>

void setMem(volatile int* a, volatile int* b, volatile int* c, volatile int* op);

int main() {
    int i;
    int A[1];
    int B[1];

    int C[1];
    
    int OP[1];

    printf("HLS AXI-Stream no side-channel data example\n");
    // Put data into A
    //for (i = 0; i < 50; i++) {
        A[0] = 27;
    //}

    // Put data into A
	//for (i = 0; i < 50; i++) {
		B[0] = 9;
	//}

    // Put data into C
	//for (i = 0; i < 50; i++) {
		C[0] = 0;
	//}

    // Put data into OP
	//for (i = 0; i < 50; i++) {
		OP[0] = 0;
	//}

    // Call the hardware functions
    setMem(A, B, C, OP);
    
    //for (i = 0; i < 10; i++)
    //	{
           if(OP[0] == 1)
                printf("A = %d B = %d C = %d, OP = %d sum\n", A[0], B[0], C[0], OP[0]);
            else    
                printf("A = %d B = %d, C = %d, OP = %d difference\n", A[0], B[0], C[0], OP[0]);
    //    }
    // Run a software version of the hardware function to validate results
    //for (i = 0; i < 50; i++) {
    //    B[i] = i + 100;
    //}

    //for (i = 0; i < 50; i++) {
	//	D[i] = i + 100;
	//}

    // Compare results
    //for (i = 0; i < 50; i++) {
    //    if (B[i] != A[i]) {
    //        printf("i = %d A = %d B = %d\n", i, A[i], B[i]);
    //        printf("ERROR 1 HW and SW results mismatch\n");
    //        return 1;
    //    }

    //    if (D[i] != C[i]) {
	//		printf("i = %d C = %d D = %d\n", i, C[i], D[i]);
	//		printf("ERROR 2 HW and SW results mismatch\n");
	//		return 1;
	//	}
    //}

    //for (i = 0; i < 10; i++)
    //	{
    //        printf("i = %d A = %d\n", i, A[i]);
    //    }

    printf("\n\n");


    //for (i = 0; i < 10; i++)
    //    	{
    //            printf("i = %d C = %d\n", i, C[i]);
    //        }

    //printf("Success HW and SW results match\n");
    return 0;
}
