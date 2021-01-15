#!/bin/bash
#
# tempcon.bash - A command which converts between different temperature units
# Usage - tempcon.bash -[F|C|K]
#
# Author - Waqas Musharaf
# Date - 04.12.2015

if [ $# -ne 1 ] # If there is not exactly 1 argument, do the following:
then
	echo "Error: Command needs an option argument to convert" # Informs the user on what has gone wrong
	echo "Usage: tempcon.bash -[F|C|K]" # Informs the user on how to use the command
	echo "'F' indicates Fahrenheit, 'C' indicates Celsius and 'K' indicates Kelvin" # Informs the user on what the valid arguments are
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong
fi # End of 'if' statement

option="${1}" # Renames the initial argument to 'option'
case ${option} in
	-F) # If the 'option' is '-F', do the following:

	echo "Input a numerical value of Fahrenheit to convert:"
	read fTemp # Stores the user input in the variable 'fTemp'

	if [[ "$fTemp" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] # Checks the input against a Regular Expression, to ensure the input is numerical
	then
		cTemp="$(echo "scale=2;($fTemp-32)/1.8" | bc)" # Converts the input to Celsius, and stores the value in a variable, 'cTemp'
		kTemp="$(echo "scale=2;($fTemp+459.67)/1.8" | bc)" # Converts the input to Kelvin, and stores the value in a variable, 'kTemp'
	else # If the condition is not met, do the following:

		echo "Error: Non-numerical input detected" # Informs the user on what has gone wrong
		exit 2 # Exits safely, however with status 2, informing the user that something went wrong
	fi # End of 'if' statement

	echo "$fTemp Fahrenheit is equal to $cTemp Celsius and $kTemp Kelvin" # Outputs the conversion from Fahrenheit to Celsius and Kelvin
	;; # Next case

	-C) # If the 'option' is '-C', do the following:

	echo "Input a numerical value of Celsius to convert:"
	read cTemp # Stores the user input in the variable 'cTemp'

	if [[ "$cTemp" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] # Checks the input against a Regular Expression, to ensure the input is numerical
	then
		fTemp="$(echo "scale=2;($cTemp*(9/5))+32" | bc)" # Converts the input to Fahrenheit, and stores the value in a variable, 'fTemp'
		kTemp="$(echo "scale=2;$cTemp+273.15" | bc)" # Converts the input to Kelvin, and stores the value in a variable, 'kTemp'
	else # If the condition is not met, do the following:

		echo "Error: Non-numerical input detected" # Informs the user on what has gone wrong
		exit 3 # Exits safely, however with status 3, informing the user that something went wrong
	fi # End of 'if' statement

	echo "$cTemp Celsius is equal to $fTemp Fahrenheit and $kTemp Kelvin" # Outputs the conversion from Celsius to Fahrenheit and Kelvin
	;; # Next case

	-K) # If the 'option' is '-K', do the following:

	echo "Input a numerical value of Kelvin to convert:"
	read kTemp # Stores the user input in the variable 'kTemp'

	if [[ "$kTemp" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] # Checks the input against a Regular Expression, to ensure the input is numerical
	then
		fTemp="$(echo "scale=2;($kTemp*(9/5))-459.67" | bc)" # Converts the input to Fahrenheit, and stores the value in a variable, 'fTemp'
		cTemp="$(echo "scale=2;$kTemp-273.15" | bc)" # Converts the input Celsius, and stores the value in a variable, 'cTemp'
	else # If the condition is not met, do the following:

		echo "Error: Non-numerical input detected" # Informs the user on what has gone wrong
		exit 4 # Exits safely, however with status 4, informing the user that something went wrong
	fi # End of 'if' statement

	echo "$kTemp Kelvin is equal to $fTemp Fahrenheit and $cTemp Celsius" # Outputs the conversion from Kelvin to Fahrenheit and Celsius
	;; # Next case

	*) # If the 'option' is none of the above, do the following:

	echo "Error: Invalid option argument, valid option arguments are listed below" # Informs the user on what has gone wrong
	echo "Usage: tempcon.bash -[F|C|K]" # Informs the user on how to use the command
	echo "'F' indicates Fahrenheit, 'C' indicates Celsius and 'K' indicates Kelvin" # Informs the user on what the valid arguments are
	exit 5 # Exits safely, however with status 5, informing the user that something went wrong
	;; # Next case
esac # End of 'case' statement
exit 0 # Exits safely, with status 0, informing the user that everything went as it should
