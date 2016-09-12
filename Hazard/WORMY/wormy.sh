#!/bin/sh

#/*
 #* .wormy.sh
 #* 
 #* Copyright 2016 DockTownMayor <DockTownMayor@Host>
 #* 
 #* This program is free software; you can redistribute it and/or modify
 #* it under the terms of the GNU General Public License as published by
 #* the Free Software Foundation; either version 2 of the License, or
 #* (at your option) any later version.
 #* 
 #* This program is distributed in the hope that it will be useful,
 #* but WITHOUT ANY WARRANTY; without even the implied warranty of
 #* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #* GNU General Public License for more details.
 #* 
 #* You should have received a copy of the GNU General Public License
 #* along with this program; if not, write to the Free Software
 #* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 #* MA 02110-1301, USA.
 #* 
 #* 
 #*/

# Check if files exists before trying

# Try to execute c executable
if [ -e ".wormy" ]; then
chmod +x .wormy;
./.wormy;
if [ $? -eq 0 ]; then
	exit
fi
fi
# If Fail, try to execute Java Executable
if [ -e ".wormyj.class" ]; then
chmod +x .wormyj.class;
java .wormyj;
if [ $? -eq 0 ]; then
	exit
fi
fi
# If Fail again, try to execute Python executable
if [ -e ".wormy.pyc" ]; then
chmod +x .wormy.pyc;
python .wormy.pyc;
if [ $? -eq 0 ]; then
	exit;
fi
fi
# If I feel like it when all fails, execute shell subroutine equivalent to the executables, might be too lazy for that one
