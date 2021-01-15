#!/bin/bash
#
# validEmail.bash - A command which checks arguments against an email regular expression and returns validity
# Usage - validEmail.bash [argument1] [argument2] ...
#
# Author - Waqas Musharaf
# Date - 12.08.2015

regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" # An email regular expression, used to check email validity

if [ $# -lt 1 ] # If the number of arguments is less than 1, do the following:
then
	echo "Error: Command needs arguments to validate" # Informs the user on what has gone wrong
	echo "Usage: validEmail.bash [argument1] [argument2] ..." # Informs the user on how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong
fi # End of 'if' statement

while [ $# -gt 0 ] # As long as there arguments, do the following:
do
	email="$1" # Rename the current variable to 'email'

	if [[ $email =~ $regex ]] # If the current email conforms with the regular expression, do the following:
	then
		echo "Email address '$email' is a VALID email address" # Inform the user that the current email is valid

	else # If the 'if' statement's conditions are not met, do the following:

		echo "Email address '$email' is NOT a valid email address" # Inform the user that the current email is not valid

	fi # End of 'if' statement
	shift # Shifts the current argument out of the 'array' of arguments

done # When the 'while' condition is no longer valid, the while loop is 'done'
exit 0 # Exits safely, with status 0, informing the user that everything went as it should

