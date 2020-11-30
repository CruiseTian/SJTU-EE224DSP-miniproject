clc;
clear;
filename = '1.wav';
[x,Fs] = audioread(filename);
x=x';
size(x)
sound(x,Fs);
T = 0.2;                     %采样时间
dt = 1/Fs;                %采样时间间隔
N = T*Fs;                    %采样点数
t = linspace(0,T,N);       %采样时间序列
N1 = 1024*2;              %快速傅里叶变换采样点数
y = fft(x,N1);            %快速傅里叶变换，第一个参数为时域函数，第二个参数为FFT的点数。N1的值应为2的n次幂
y = abs(y)/(N1/2);        %取实数并进行幅值修正
f = linspace(0,Fs,N1);    %频率序列
plot(t,x);
plot(f,y);