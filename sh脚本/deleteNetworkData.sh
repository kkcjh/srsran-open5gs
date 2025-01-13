#!/bin/bash

# 设置目录路径
DIR_PATH="/home/kk/networkData"

# 设置文件空间的限制大小（单位：MB）
LIMIT_SIZE=6000
TARGET_SIZE=3000

# 无限循环
while true; do
    # 获取目录下所有文件的总大小（单位：KB）
    TOTAL_SIZE=$(du -sm "$DIR_PATH" | awk '{print $1}')

    # 检查总大小是否超过了限制大小
    if [ "$TOTAL_SIZE" -gt "$LIMIT_SIZE" ]; then
        echo "目录空间超过了限制大小，开始删除日期较久远的文件..."

        # 获取目录下所有文件的路径，并按照修改时间排序（最旧的在前）
        OLD_FILES=$(find "$DIR_PATH" -type f -printf '%T@ %p\n' | sort -n | awk '{print $2}')

        # 删除日期较久远的文件，直到目录大小小于目标大小
        for file in $OLD_FILES; do
            echo "删除文件：$file"
            rm -f "$file"
            # 重新计算目录大小
            TOTAL_SIZE=$(du -sk "$DIR_PATH" | awk '{print $1}')
            # 如果目录大小小于目标大小，则退出循环
            if [ "$TOTAL_SIZE" -le "$TARGET_SIZE" ]; then
                echo "目录空间已小于目标大小，停止删除文件。"
                break
            fi
        done
    else
        echo "目录空间未超过限制大小，无需删除文件。"
    fi

    # 暂停10秒
    sleep 3600
done
