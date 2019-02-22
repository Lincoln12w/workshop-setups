#!/bin/bash
# Just want to remove all annoying .DS_Store files when tar a package.

IFS=$'\n'		# set the 'Internal Field Separator' to '\n'.

rm $1
find $(pwd) -name .DS_Store -delete
find $(pwd) -name "*.pyc" -delete
tar -zcvf $1 $2
if [ "$3" == "-r" ]; then
	rm -rf $2
fi
