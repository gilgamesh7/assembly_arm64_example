// Listing1-2.S 
//
// A simple C++ program that calls 
// an assembly language function 
//
// Need to include stdio.h so this 
// program can call printf().

#include <stdio.h>

// extern "C" namespace prevents 
// "name mangling" by the C++
// compiler. 

extern "C"
{
    // Here's the external function, 
    // written in assembly language, 
    // that this program will call:

    void asmMain(void);
};

int main(void){
    printf("Calling asmMain() from C++\n");
    asmMain();
    printf("Returned to C++ from asmMain()\n");
}