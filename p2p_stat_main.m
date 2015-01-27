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
%1��ͳ��ÿ5���ж��ٸ�peer�ڻ�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hf=figure('Position', [100 scrsz(4)/2-300 scrsz(3)/1.4 scrsz(4)/2+200]);
plot(times, upeer, '--rx');
hold on
plot(times, dpeer, '--bs');
grid on;
legend('�ϴ�peer��','����peer��','best')
ylabel('peer��');
xlabel('ʱ�� / second');

titlestr=sprintf('1��ͳ��ÿ5���ж��ٸ�peer�ڻ������� - taskname: %s', taskname);
title(titlestr);
if bGraph_output_to_file>0
    fig_file_name=sprintf('plot_of_peer_count_about_%s', taskname);
    fig_save_to_file(hf,fig_file_name,save_file_type,save_to_sub_dir);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2��ͳ������ǰ���������ʣ��ϴ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hf=figure('Position', [100 scrsz(4)/2-300 scrsz(3)/1.4 scrsz(4)/2+200]);
plot(times, urate, '--rx');
hold on
plot(times, drate, '--bs');
grid on;
legend('�ϴ��ٶ�','�����ٶ�','best')
ylabel('�������ء��ϴ�����/KBps');
xlabel('ʱ�� / second');

titlestr=sprintf('2��ͳ������ǰ�����ء��ϴ����� - taskname: %s', taskname);
title(titlestr);
if bGraph_output_to_file>0
    fig_file_name=sprintf('plot_of_download_upload_rate_about_%s', taskname);
    fig_save_to_file(hf,fig_file_name,save_file_type,save_to_sub_dir);
end
