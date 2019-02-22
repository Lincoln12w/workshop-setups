#!bin/bash
#
# Because the docx, pptx, xlsx, visdx all formed by zip,
# Parse them automatically for convience.	
#
# Modify History
# --------------
# 00a 29mar17 lzw create
# 01a 30mar17 lzw add corrupt zip file detect.

suffix=""

get_suffixes () {
	unzip -l $1 > /dev/null 2>&1
	if [ "$?" -ne 0 ]; then
		suffix="zip-corrupt"
	elif [ ! -z "$(unzip -l $1 | grep word)" ]; then
		suffix="docx"              # word
	elif [ ! -z "$(unzip -l $1 | grep xl)" ]; then
		suffix="xlsx"              # excel
	elif [ ! -z "$(unzip -l $1 | grep ppt)" ]; then
		suffix="pptx"              # ppt
	elif [ ! -z "$(unzip -l $1 | grep visio)" ]; then
		suffix="vsdx"              # visio
	else
		suffix="zip"
	fi
}

for file in ./*
do
	get_suffixes $file
	filename=${file%\.*}.$suffix
	mv $1 $filename
done