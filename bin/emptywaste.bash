#!/bin/bash
#
# emptywaste.bash - A command that deletes for good everything in the '.waste' directory
# Usage - emptywaste.bash
#
# Author - Waqas Musharaf
# Date - 12.02.2015

if [ $# -gt 0 ] # If there are more than 0 arguments, do the following:
then
	echo "Error: Command does not require arguments" # Informs the user what has gone wrong
	echo "Usage: emptywaste.bash" # Informs the user how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

rm -rf /home/stud/u1561634/.waste/* # Removes all files in the '.waste' directory
# Note: This command will remove ALL the files in the '.waste' directory from ALL directories due to the extension '-f' (force)

exit 0 # Exits safely, with status 0, informing the user that everything went as it should
