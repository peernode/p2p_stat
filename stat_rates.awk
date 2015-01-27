BEGIN{	
	udp_upload_sum=0;
	udp_upload_rate=0;
	upload_peer=0;
	udp_download_sum=0;
	udp_download_rate=0;
	download_peer=0;
	
	last_stat_time=0;
	cur_time=0;	
	
	base_len=800;	
	interval=5;  # 5 seconds
}

# $2:time, $3:src ip, $4: dst:ip,  $8: len
{
	if(NR==1){
		last_stat_time=int($2);
	}
	cur_time=int($2);
	len=$8;
	src_ip=$3;
	dst_ip=$4;
	if(src_ip==local_ip && len>=base_len){
		udp_upload_sum += len;
		
		dst_ip_contrib[dst_ip]+=len;
		if(dst_ip_contrib[dst_ip]>10240){
			if(dst_ip_ary[dst_ip]==0){
				dst_ip_ary[dst_ip]=1;
				upload_peer++;
			}
		}
	}
	
	if(dst_ip==local_ip && len>=base_len){
		udp_download_sum += len;
		
		src_ip_contrib[src_ip]+=len;
		if(src_ip_contrib[src_ip]>16384){
			if(src_ip_ary[src_ip]==0){
				src_ip_ary[src_ip]=1;
				download_peer++;
			}
		}
	}
	
	if(cur_time>last_stat_time+interval){
		last_stat_time=cur_time;
		udp_upload_rate=int(udp_upload_sum/interval/1024);
		udp_download_rate=int(udp_download_sum/interval/1024);
		print cur_time, udp_upload_rate, upload_peer, udp_download_rate, download_peer;
		udp_upload_sum=0;
		udp_download_sum=0;
		
		delete dst_ip_ary;
		delete dst_ip_contrib;
		upload_peer=0;
		delete src_ip_ary;
		delete src_ip_contrib
		download_peer=0;
	}
}

END{
}