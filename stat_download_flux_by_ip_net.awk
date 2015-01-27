#! /bin/igawk -f

@include common_funs.awk

BEGIN{
	base_len = 800;
	stat_size=1024;  #以k为单位
}

NR==FNR {  # 第一个文件是IP库
	    ip_begin[k] = $1; 
        ip_end[k] = $2;
        record[k]=$0;
        province[k]=$3;  
        net_operator[k]=$4;           
        k++; 
} 

# $2:time, $3:src ip, $4: dst:ip,  $8: len
NR>FNR {	
	src_ip=$3;
	dst_ip=$4;
	
	len=$8;
	if(dst_ip==local_ip && len>=base_len){  #数据长度大于800个字节
		flux_stat_by_ip_net[src_ip]+=len;
		#print src_ip, flux_stat_by_ip_net[src_ip]
	}	
}

END{
	for(idx in flux_stat_by_ip_net){
		#print idx, flux_stat_by_ip_net[idx]
		host_ip = get_ip_int(idx);
		host_idx = binary_search_ip(ip_begin,ip_end, host_ip);
		source_net = net_operator[host_idx];
		source_pro=province[host_idx];
		#print idx, host_ip
		print idx, source_net, source_pro, int(flux_stat_by_ip_net[idx]/stat_size);
	}
}