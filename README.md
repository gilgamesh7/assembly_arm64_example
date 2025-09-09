# assembly_arm64_example
First assembly level language programs and C, for apple silicon ARM 64


# Links
- [The Art of ARM Assembly, Volume 1 , Randall Hyde](https://learning.oreilly.com/library/view/the-art-of/9798341620018/xhtml/title.xhtml)
- [how hello world for arm64 assembly really works (apple silicon)](https://youtu.be/d0OXp0zqIo0)
- [Supervisor (svc) Calls for Apple](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)
- [Assembly Language Programming with ARM – Full Tutorial for Beginners](https://youtu.be/gfmRrPjnEw4)
- [CPUlator](https://cpulator.01xz.net/)
- [ARM64 M1 Registers](https://eclecticlight.co/2021/06/16/code-in-arm-assembly-registers-explained/)

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
- Link with _main : ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
- Link with _start : ld movestop.o -o movestop -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

## ARMv7 DEC-SoC 32-bit
### Mapping ARMv7 32-bit to Apple Silicon M1 64-bit
| Purpose | ARMv7 DEC-SoC 32-bit 16 MB | Apple Silicon M1 64-bit 16 GB |
|--------|-------------|-----------------------|
| System Call Register | R7 | X16 |
| Software Interrupt | swi | svc |

# Programs
## Listing1-1.S
### Type 1
- as -arch arm64 Listing1-1.S -o Listing1-1.o
- ld -o Listing1-1 Listing1-1.o -lSystem \
     -syslibroot `xcrun -sdk macosx --show-sdk-path` \
     -e _main -arch arm64 
- ./Listing1-1
### Type 2
- g++ -o Listing1-1 Listing1-1.S OR
- clang -o Listing1-1 Listing1-1.S (only on macos)
- ./Listing1-1
- To Explain : g++ -E Listing1-1.S

## Listing1-2.cpp & Listing1-3.S
- g++ -o Listing1-2 Listing1-2.cpp Listing1-3.S
- ./Listing1-2