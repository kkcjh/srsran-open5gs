#!/bin/bash

# 设置抓包的持续时间（单位秒）
CAPTURE_DURATION=$((3600*2))

# 设置保存抓包数据的目录
CAPTURE_DIR="/home/kk/networkData"

# 检查目录是否存在，如果不存在则创建
if [ ! -d "$CAPTURE_DIR" ]; then
    mkdir -p "$CAPTURE_DIR"
fi

# 无限循环，每隔一小时执行一次抓包
while true; do
    # 获取当前时间作为文件名
    FILENAME=$(date +"%Y%m%d_%H%M%S")
    CAPTURE_FILE="$CAPTURE_DIR/${FILENAME}_capture.pcap"

    # 使用 sudo -u kk 来以 kk 用户的身份运行 tshark
    sudo -u kk tshark -i any -a duration:$CAPTURE_DURATION -w "$CAPTURE_FILE"

    # 等待一段时间，确保文件写入完成
    sleep 10
done
