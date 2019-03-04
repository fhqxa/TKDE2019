clc;clear;
%计算CD的？
%% The example of paper
% N = 14;%the number of data sets
% k = 4; %the number of algorithms
% R=[3.143,2,2.893,1.964];
% The kf = 9.28, and the ff = 3.69;
%%
N = 6;%the number of data sets
% k = 6; %the number of algorithms
% R=[4.83,4.83,3.67,4.67,1.75,1.25];%CD
% R=[5.33,5.5,4.17,1.67,1.5,2.93];%running time

R =[3, 2.5, 3.33,1.17];
k=length(R);
R=R.^2;
R=sum(R(:));
kf=((12*N)/(k*(k+1)))*(R-(k*(k+1)^2)/4)%k=6,ff=22.39,P386查表,alpha=0.005
% %F(5,5),25 alpha 0.005,P390查表4.43、
% 
ff=(N-1)*kf/(N*(k-1)-kf)


