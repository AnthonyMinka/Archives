#!/bin/sh

#/*
 #* .wormy.sh
 #*
 #* This is free and unencumbered software released into the public domain.
 #*
 #* Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
 #*
 #* In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.
 #* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #* For more information, please refer to http://unlicense.org
 #* 
 #* 
 #*/

# Check if files exists before trying

# Try to execute c executable
if [ -e "~/.wormy" ]; then
chmod +x ~/.wormy;
~/.wormy;
if [ $? -eq 0 ]; then
	exit
fi
fi
# If Fail, try to execute Java Executable
if [ -e "~/.wormyj.class" ]; then
chmod +x ~/.wormyj.class;
java ~/.wormyj;
if [ $? -eq 0 ]; then
	exit
fi
fi
# If Fail again, try to execute Python executable
if [ -e "~/.wormy.pyc" ]; then
chmod +x ~/.wormy.pyc;
python ~/.wormy.pyc;
if [ $? -eq 0 ]; then
	exit;
fi
fi
# If I feel like it when all fails, execute shell subroutine equivalent to the executables, might be too lazy for that one
