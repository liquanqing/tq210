#!/bin/bash
if [ "$#" = 1 ]; then 
    echo ready to write bin to /dev/sdb
    sudo dd if=$1 of=/dev/sdb bs=512 seek=1
    sync
    echo done
else 
    echo $#
    echo wrong
    echo "please input a bin file"
fi
