#!/bin/bash
#
# wastesize.bash - A command which reports the number of files in the '.waste' directory
# Usage - wastesize.bash
#
# Author - Waqas Musharaf
# Date - 12.02.2015

if [ $# -gt 0 ] # If there are more than 0 arguments, do the following:
then
	echo "Error: Command does not require arguments" # Informs the user what has gone wrong
	echo "Usage: wastesize.bash" # Informs the user how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

echo -n "Current number of files in '.waste' is " & ls /home/stud/u1561634/.waste | wc -l
# Informs the user of the exact number of files currently in the directory '.waste'
# The exact calculation the command makes is the word count (wc) of the lines (-l) in '.waste'
# 'echo -n' is used to ensure all the output is on one line

exit 0 # Exits safely, with status 0, informing the user that everything went as it should
