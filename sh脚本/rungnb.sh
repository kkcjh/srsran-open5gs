#!/bin/bash
# 改变路径
cd /home/kk/srsRAN_Project-main/build/apps/gnb
while true; do

    ./gnb -c n1.yml
    
    if [ $? -ne 0 ];then
        echo "restart1"
    else
        echo "restart2"
    fi
    sleep 5
done    
