#!/bin/bash
#
# chmx.bash - A command that takes filenames as its arguments and makes those files executable to all users
# Usage - chmx.bash [argument1] [argument2] ...
#
# Author - Waqas Musharaf
# Date - 11.30.2015

if [ $# -lt 1 ] # If there is less than 1 argument, do the following:
then
	echo "Error: Command needs file arguments to make exectuable" # Informs the user what has gone wrong
	echo "Usage: chmx.bash [argument1] [argument2] ..." # Informs the user how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

while [ $# -gt 0 ] # As long as there are arguments, do the following:
do
	filename="$1" # Renames the current variable
	chmod u+x "$filename" # Grants users execute permissions
	chmod g+x "$filename" # Grants group execute permissions
	chmod o+x "$filename" # Grants others execute permissions
	shift # Shifts current argument out of the 'array' of arguments

done # When the 'while' condition is no longer valid, the while loop is 'done'
exit 0 # Exits safely, with status 0, informing the user that everything went as it should
