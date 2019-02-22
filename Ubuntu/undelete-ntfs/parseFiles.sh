#!bin/bash
#
# Usage:
#	sh classifyFiles.sh
#
# Note:
#	'file' command's output may different on different os version.
#
# Modify History
# --------------
# 00a 30mar17 lzw create

# archive types
mkdir ../gzips ../zips ../cs ../texts

# parse all files in the current directory
for file in ./*
do
	# get file type
	t=$(file $file)
	t=${t#*\ }
	t=${t%%,*}
	echo $t

	# add supported file type and the actions here
	case $t in
		"Zip archive data")
			mv -v $file ../zips/
			sh /utils/parseZip.sh ../zips/$file
			;;
		"gzip compressed data")
			mv -v $file ../gzips/${file}.tar.gz
			;;
		"ASCII text")
			mv -v $file ../texts/${file}.txt
			;;
		"C source")
			mv -v $file ../cs/${file}.c
			;;
	esac
done
