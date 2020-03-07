clc;
clear all; %#ok<CLALL>
close all;

% c = [8,6,10,9;
%      9,12,13,7;
%      14,9,16,5];
% d = [45,20,30,30];%demand
% s = [35,50,40];%supply

%This example is OK!
c = [1.5, 2.0, 0.3, 3.0;
     7.0, 0.8, 1.4, 2.0;
     1.2, 0.3, 2.0, 2.5];
     
d = [50,70,80,30];%demand
s = [100,80,50];%supply

% c = [15,35,25;
%      10,50,40;
%      90,80,110];
%      
% d = [30,30,30];%demand
% s = [40,30,20];%supply

fun_Trans_Problem(c,s,d)