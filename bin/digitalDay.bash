#!/bin/bash
#
# digitalDay.bash - A command which takes any positive numeric argument, divides each positive numeric argument by 7, and takes the remainder of each.
#		    A day corresponding to each remainder is then printed for the user. The command stops when all arguments have been checked, or when
#		    the control flag (-1) detected. If the control flag is detected, the total number of valid and invalid inputs is printed.
#
# Usage - digitalDay.bash [argument1] [argument2] ...
#
# Author - Waqas Musharaf
# Date - 12.08.2015

if [ $# -lt 1 ] # If there is less than one argument, do the following:
then
	echo "Error: The command needs at least one positive numeric integer argument to run successfully" # Informs the user on what went wrong
	echo "Usage: digitalDay.bash [argument1] [argument2] ..." # Informs the user on how to use the command
	echo "You may enter '-help' as an argument for a help page, or '-1' to stop the program and check the number of valid and invalid inputs"
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

valid=0 # Sets the variable 'valid' to zero
invalid=0 # Sets the variable 'invalid' to zero

while [ $# -gt 0 ] # As long as there are arguments, do the following:
do
	arg="$1" # Renames the current variable to 'arg'

	if [ $arg == "-1" ] # If 'arg' is '-1', do the following:
	then
		total=$(($valid+$invalid)) # Calculate the total number of input arguments entered
		echo "Control flag (-1) detected" # Inform the user on what happened
		echo "Total valid inputs: $valid" # Inform the user on the total number of valid arguments inputted
		echo "Total invalid inputs: $invalid" # Inform the user on the total number of invalid arguments inputted
		echo "Total inputs: $total" # Inform the user on the total number of arguments inputted
		exit 0 # Exits safely, with status 0, informing the user that everything went as it should

	elif [ $arg == "-help" ] # If 'arg' is '-help', do the following:
	then
		echo "HELP: The command needs at least one positive numeric integer argument to run successfully" # Informs the user on how to use the command
		echo "Usage: digitalDay.bash [argument1] [argument2] ..."
		echo "You may enter '-1' as an argument to stop the program and check the number of valid and invalid inputs"
		exit 0 # Exits safely, with status 0, informing the user that everything went as it should

	elif ! [[ $arg =~ ^[0-9]+$ ]] # If 'arg' does not conform to these rules (is not a positive integer), do the following:
	then
		echo "Error: Invalid argument, not a positive numeric integer argument" # Informs the user on what went wrong
		invalid=$(($invalid+1)) # Increments 'invalid' by one

	elif [[ $arg =~ ^[0-9]+$ ]] # If 'arg' conforms to these rules (is a positive integer), do the following:
	then
		mod=$(($arg%7)) # Assign 'mod' the remainder of 'arg' divided by 7

		if [ $mod == 0 ] # If 'mod' is equal to 0, do the following:
		then	echo "Sunday" # Echo the day assigned to 0
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 1 ] # If 'mod' is equal to 1, do the following:
		then	echo "Monday" # Echo the day assigned to 1
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 2 ] # If 'mod' is equal to 2, do the following:
		then	echo "Tuesday" # Echo the day assigned to 2
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 3 ] # If 'mod' is equal to 3, do the following:
		then	echo "Wednesday" # Echo the day assigned to 3
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 4 ] # If 'mod' is equal to 4, do the following:
		then	echo "Thursday" # Echo the day assigned to 4
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 5 ] # If 'mod' is equal to 5, do the following:
		then	echo "Friday" # Echo the day assigned to 5
			valid=$(($valid+1)) # Increments 'valid' by one
		elif [ $mod == 6 ] # If 'mod' is equal to 6, do the following:
		then	echo "Saturday" # Echo the day assigned to 6
			valid=$(($valid+1)) # Increments 'valid' by one

		else # If none of the 'if' conditions are met, do the following:
			echo "Unexpected Error: Modulo of argument cannot be achieved" # Informs the user on what has gone wrong
			invalid=$(($invalid+1)) # Increments 'invalid' by one

		fi # End of 'if' statement

	else # If none of the 'if' conditions are met, do the following:

		echo "Unexpected Error: Argument unreadable" # Informs the user on what has gone wrong
		invalid=$(($invalid+1)) # Increments 'invalid' by one

	fi # End of 'if' statement

shift # Shifts the current argument out of the 'array' of arguments
done # When the 'while' condition is not longer valid, the while loop is 'done'
exit 0 # Exits safely, with status 0, informing the user that everything went as it should
