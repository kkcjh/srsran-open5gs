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

# 运行 nat.sh 并检查是否成功
echo "Running nat.sh..."
bash nat.sh
if [ $? -ne 0 ]; then
  echo "nat.sh failed. Exiting..."
  exit 1
fi
echo "nat.sh executed successfully."

# 运行 runopen5gs.sh 并检查是否成功
echo "Running runopen5gs.sh..."
bash runopen5gs.sh
if [ $? -ne 0 ]; then
  echo "runopen5gs.sh failed. Exiting..."
  exit 1
fi
echo "runopen5gs.sh executed successfully."

# 在新的 GNOME 终端窗口中运行 rungnb.sh
echo "Opening new GNOME terminal window to run rungnb.sh..."
gnome-terminal -- bash -c "bash rungnb.sh; exec bash"

# 在新的 GNOME 终端窗口中运行 rungnb.sh
echo "Opening new GNOME terminal window to run capture_packets.sh..."
gnome-terminal -- bash -c "bash capture_packets.sh; exec bash"

# 在新的 GNOME 终端窗口中运行 deleteNetworkData.sh
echo "Opening new GNOME terminal window to run deleteNetworkData.sh..."
gnome-terminal -- bash -c "bash deleteNetworkData.sh; exec bash"

echo "All scripts executed successfully."
