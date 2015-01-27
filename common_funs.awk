function get_value(info_field,seperator)
{
split(info_field, a, seperator);
return a[2];
}

function get_name(info_field,seperator)
{
split(info_field, a, seperator);
return a[1];
}

function get_idx_value(info_field,seperator,idx)
{
split(info_field, a, seperator);
return a[idx];
}

function get_ip_int(ip_string)
{
	ip_int=0;
	
	for (i=1;i<=4;i++){
  ip[i]=get_idx_value(ip_string,".",i);
	}

	for (i=1;i<=4;i++){
  ip_int+=ip[i]*256^(4-i)
	}
		
	#ip_int=ip[1]*256*256*256+ip[2]*256*256+ip[3]*256+ip[4]
	
	return ip_int;		
}

function get_ip_str_n(ip_int) #������
{
	ip_0=int(ip_int/256/256/256);
	ip_1=(int(ip_int/256/256))%256;
	ip_2=int(ip_int/256)%256;
	ip_3=ip_int%256;
			
  
  ip_str=sprintf("%d.%d.%d.%d",ip_3,ip_2,ip_1,ip_0);
  
	return ip_str;		
}

function get_ip_str(ip_int) #������
{
	ip_0=int(ip_int/256/256/256);
	ip_1=(int(ip_int/256/256))%256;
	ip_2=int(ip_int/256)%256;
	ip_3=ip_int%256;
			
  
  ip_str=sprintf("%d.%d.%d.%d",ip_0,ip_1,ip_2,ip_3);
  
	return ip_str;		
}

function ntohl(n_ip) #������ת������
{
	ip_0=int(n_ip/256/256/256);
	ip_1=(int(n_ip/256/256))%256;
	ip_2=int(n_ip/256)%256;
	ip_3=n_ip%256;
	
	host_ip = ip_3*256*256*256 + ip_2*256*256 + ip_1*256 + ip_0;
	return host_ip;
}

function binary_search_ip(ip_begin,ip_end,ip_addr){
   start= 0; end =length(ip_begin);  

while(start<= end) {  
                mid =int(start+ ((end - start)/2))  
                
#start,end���ܴ�ʱ������Ԫ�شﵽ 2^30 ʱ��ƽ������mid =int((start+ end)/2)���������������ֵ 2^31 -1��
#��ʱ�������ֵΪ���ˡ�����Ҫ������취
 
								if(ip_addr>=ip_begin[mid]&& ip_addr<=ip_end[mid]){
									{ 
										break}  
								}else if(ip_addr>ip_end[mid] ) {start = mid+1 
									
								}
                else end= mid-1  
}  
	return mid;
}