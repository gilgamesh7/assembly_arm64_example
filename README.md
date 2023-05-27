# assembly_arm64_example
First assembly level language programs and C, for apple silicon ARM 64


# Links
- [how hello world for arm64 assembly really works (apple silicon)](https://youtu.be/d0OXp0zqIo0)
- [Supervisor (svc) Calls for Apple](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)

# Prerequisites
- Install xcode : xcode-select --install
    - "code-select: error: command line tools are already installed" means you already have it 
- Install gcc : brew install gcc
    - try gcc to see if you already have it
- Can also use clang instead of gcc

# How it works
- For C file
    - .c -> (compile) -> .o -> (link) -> executable

# utilities 
- Get path to sdk with libraries : xcrun -sdk macosx --show-sdk-path
# Steps
## C File
- Create hello.c file
- Compile & Link : gcc hello.c -o hello
- Compile only & generat eobjectfile : gcc hello.c -c -o hello.o
- Link : ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64

## Assembly
- Create .s file
- compile : as hello.s -o hello.o
- Link : ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
