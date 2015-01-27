#!/bin/bash

local_ip=$1
input=$2

#4.1 统计udp下载速率，上传速率：每隔5秒统计一次速率；
awk -f stat_rates.awk -v local_ip=${local_ip} ${input} > ${input}_output.log
echo "stats rate of " ${input}

#4.2 按网络统计
igawk -f stat_download_flux_by_ip_net.awk -v local_ip=${local_ip} ip_data ${input}  | LC_ALL='C' sort -k4 -nr > ${input}_by_net.log
echo "stats ip net of " ${input} 


