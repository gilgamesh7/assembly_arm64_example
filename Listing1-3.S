// A simple Gas module that contains 
// an empty function to be called by 
// the C++ code in Listing 1-2

    .text

    .global _asmMain, asmMain   // make label visible 
                                // outside this file
    .align 2                   // align following code 
                                // on a word boundary

// Empty function just returns to C++ code. 
_asmMain:                       // function label   
asmMain:
    // Empty function just returns to C++ code. 
    ret                         // return to caller