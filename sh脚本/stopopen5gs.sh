#!/bin/bash

# 定义一个数组，包含所有要停止的 open5gs 服务
declare -a services=(
    "open5gs-amfd.service"
    "open5gs-hssd.service"
    "open5gs-nssfd.service"
    "open5gs-scpd.service"
    "open5gs-smfd.service"
    "open5gs-upfd.service"
    "open5gs-ausfd.service"
    "open5gs-mmed.service"
    "open5gs-pcfd.service"
    "open5gs-sgwcd.service"
    "open5gs-udmd.service"
    "open5gs-bsfd.service"
    "open5gs-nrfd.service"
    "open5gs-pcrfd.service"
    "open5gs-sgwud.service"
    "open5gs-udrd.service"
    "open5gs-seppd.service"
    "open5gs-webui.service"
)

# 遍历数组，停止每个服务
for service in "${services[@]}"; do
    echo "Stopping ${service}..."
    sudo systemctl stop "$service"
    if [ $? -eq 0 ]; then
        echo "${service} stopped successfully."
    else
        echo "Failed to stop ${service}."
    fi
done

echo "All Open5GS services have been attempted to stop."
