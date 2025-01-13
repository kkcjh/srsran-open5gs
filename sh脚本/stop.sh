#!/bin/bash
pkill -9 -f "bash .*rungnb.sh"
pkill -9 -f "bash .*deleteNetworkData.sh"
pkill -9 -f "bash .*capture_packets.sh"
cd /home/kk
# 运行 stopopen5gs.sh 并检查是否成功
echo "Running stopopen5gs.sh..."
bash stopopen5gs.sh
if [ $? -ne 0 ]; then
  echo "stopopen5gs.sh failed. Exiting..."
  exit 1
fi
echo "stopopen5gs.sh executed successfully."

