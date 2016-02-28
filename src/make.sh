#!/bin/sh

rm -f -r verilog
rm -f -r vhdl
rm -f -r systemverilog

ls *.hs | xargs  clash --verilog && \
ls *.hs | xargs  clash --vhdl && \
ls *.hs | xargs  clash --systemverilog && echo "build sucesfull"

rm *.hi
rm *.o
