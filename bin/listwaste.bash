#!/bin/bash
#
# listwaste.bash - A command which lists the names of all the files in the '.waste' directory and their size in bytes
# Usage - listwaste.bash
#
# Author - Waqas Musharaf
# Date - 12.02.2015

if [ $# -gt 0 ] # If there are more than 0 arguments, do the following:
then
	echo "Error: Command does not require arguments" # Informs the user what has gone wrong
	echo "Usage: listwaste.bash" # Informs the user how to use the command
	exit 1 # Exits safely, however with status 1, informing the user that something went wrong

fi # End of 'if' statement

ls -l /home/stud/u1561634/.waste | awk '{print "Filename: "$9, "## File size: " $5, "bytes"}'
# Displays the contents of the directory '.waste' in long listing format
# "awk '{print ... $9, ... $5 ...}" ensures only the name and size of each file is displayed, other information is irrelevant
# Note: awk prints an extra line with empty fields, minor cosmetic bug

exit 0 # Exits safely, with status 0, informing the user that everything went as it should
