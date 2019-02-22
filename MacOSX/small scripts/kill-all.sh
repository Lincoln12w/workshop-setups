#!/bin/bash
#
# Descriptor:
#	kill all processes
#
# Modify History
# --------------
# 00a 25jun18 lzw create

echo "Found the following processes:"

ps -a | grep "$1"

read -p "Sure about kill them all?" yn

echo "$yn"

if [[ "$yn" = "y" ]]; then

    echo "As you wish!"

    ps -a | grep "$1" | gawk '{print $1}' | xargs kill

fi