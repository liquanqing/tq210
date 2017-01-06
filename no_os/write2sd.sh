#!/bin/bash
if [ "$#" = 1 ]; then 
    echo right
    echo ready to add header for $1
    ./add_head $1 210.bin
    echo add header done
    echo ready to write bin to /dev/sdb
    sudo dd if=$1 of=/dev/sdb bs=512 seek=1
    rm 210.bin
    sync
    echo done
else 
    echo $#
    echo wrong
    echo "please input a bin file"
fi
