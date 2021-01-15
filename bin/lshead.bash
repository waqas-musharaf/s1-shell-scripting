#!/bin/bash
#
# lshead.bash - Lists the first few lines of a every file in a directory specified. Has options to list the first 'x' lines or last 'x' lines of the files.
# Usage - lshead.bash [directory]
#
# Author - Waqas Musharaf
# Date - 11.30.2015

if [ $# -ne 1 ] # If there is not exactly 1 argument, do the following:
then
	echo "Error: Command needs a directory argument to search for files from" # Informs the user what has gone wrong
	echo "Usage: lshead.bash [argument]" # Informs the user how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

dir="$1" # Renames the initial argument to 'dir' (directory)

echo "Would you like to list the start or the end of each file? Enter 'S' for start or 'E' for end"
# Asks which part of the files the user would like to search
read pos # Stores the input as a variable, 'pos'

echo "How many lines of each file would you like to list? Please enter an positive integer value"
# Asks how many lines of each file the user would like to list
read val # Stores the input as a variable, 'val'

if [ $val -gt 0 ] # If the variable 'val' is greater than 0, do the following:
then
	if [ $pos == "S" ] # If the variable 'pos' is 'S', do the following:
	then
		files=$(ls $dir) # Creates a variable, 'files', that contains a list of all files in 'dir'
		for cur in $files; # For each file ('cur') in 'files', do the following:
		do
			echo "********** START OF FILE: $cur **********" # Outputs a line of asterisks and a file label for easy viewing
			cat $dir/$cur | head -$val; # Outputs 'val' amount of lines of the file at 'dir/cur' starting from the head of the file
			echo "*********** END OF FILE: $cur ***********" # Outputs a line of asterisks and a file label for easy viewing
			echo # Inserts a linebreak for seperation of files
		done # Once all files in 'files' have been processed, the for loop is 'done'

	exit 0 # Exits safely, with status 0, informing the user that everything went as it should

	elif [ $pos == "E" ] # If the variable 'pos' is 'E', do the following:
	then
		files=$(ls $directory) # Creates a variable, 'files', that contains a list of all files in 'dir'
		for cur in $files; # For each file, ('cur') in 'files'
		do
			echo "********** START OF FILE: $cur **********" # Outputs a line of asterisks and a file label for easy viewing
			cat $dir/$cur | tail -$val; # Outputs 'val' amout of lines of the file at 'dir/cur' starting from the tail of the file
			echo "*********** END OF FILE: $cur ***********" # Outputs a line of asterisks and a file label for easy viewing
			echo # Inserts a linebreak for seperation of files
		done # Once all the files in 'files' have been processed, the for loop is 'done'

	else # If neither if statement's conditions are met, do the following:
		echo "Error: Invalid input, you must enter either 'S' or 'E', according to the part of the files to list, please retry"
		# Informs the user that they inputted an invalid section of files to list
		exit 2 # Exits safely, however with status 2, informing the user that something went wrong

	fi # End of 'if' statement

else # If the if statement's condition is not met, do the following:
	echo "Error: Invalid input, you must enter a positive integer value of lines to list, please retry"
	# Informs the user that they entered an invalid value of lines to list
	exit 3 # Exits safely, however with status 3, informing the user that something went wrong

fi # End of 'if' statement
