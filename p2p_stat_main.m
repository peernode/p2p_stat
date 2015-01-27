clear all;
close all;
format long g;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Graph Output Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bGraph_output_to_file=1; %%0: not write to file;
save_to_sub_dir=1;
save_file_type=3; %%0:    emf; 1:    eps; 2: both

scrsz = get(0,'ScreenSize');

taskname='letv-heyi32'
format1='%d\t%d\t%d\t%d\t%d';
filename=sprintf('letv_wumn76_3.log_output.log');
[times, urate, upeer, drate, dpeer]=textread(filename, format1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1、统计每5秒有多少个peer在互传数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hf=figure('Position', [100 scrsz(4)/2-300 scrsz(3)/1.4 scrsz(4)/2+200]);
plot(times, upeer, '--rx');
hold on
plot(times, dpeer, '--bs');
grid on;
legend('上传peer数','下载peer数','best')
ylabel('peer数');
xlabel('时间 / second');

titlestr=sprintf('1、统计每5秒有多少个peer在互传数据 - taskname: %s', taskname);
title(titlestr);
if bGraph_output_to_file>0
    fig_file_name=sprintf('plot_of_peer_count_about_%s', taskname);
    fig_save_to_file(hf,fig_file_name,save_file_type,save_to_sub_dir);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2、统计任务当前的下载速率，上传速率
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hf=figure('Position', [100 scrsz(4)/2-300 scrsz(3)/1.4 scrsz(4)/2+200]);
plot(times, urate, '--rx');
hold on
plot(times, drate, '--bs');
grid on;
legend('上传速度','下载速度','best')
ylabel('任务下载、上传速率/KBps');
xlabel('时间 / second');

titlestr=sprintf('2、统计任务当前的下载、上传速率 - taskname: %s', taskname);
title(titlestr);
if bGraph_output_to_file>0
    fig_file_name=sprintf('plot_of_download_upload_rate_about_%s', taskname);
    fig_save_to_file(hf,fig_file_name,save_file_type,save_to_sub_dir);
end
