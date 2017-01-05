#!/bin/bash
if [ "$#" = 1 ]; then 
    echo right
    echo $1
    sudo dd if=$1 of=/dev/sdb bs=512 seek=1
else 
    echo $#
    echo wrong
    echo "please input a bin file"
fi
