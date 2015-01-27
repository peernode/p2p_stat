#!/bin/bash

local_ip=$1
input=$2

#4.1 ͳ��udp�������ʣ��ϴ����ʣ�ÿ��5��ͳ��һ�����ʣ�
awk -f stat_rates.awk -v local_ip=${local_ip} ${input} > ${input}_output.log
echo "stats rate of " ${input}

#4.2 ������ͳ��
igawk -f stat_download_flux_by_ip_net.awk -v local_ip=${local_ip} ip_data ${input}  | LC_ALL='C' sort -k4 -nr > ${input}_by_net.log
echo "stats ip net of " ${input} 


