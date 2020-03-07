clc;
clear all; %#ok<CLALL>
close all;
Ab=[];

As=[-3 -2;-1 -4;-3 -1];
b=[-7;-5;-2];
c=[-4 -5];


[X,z]=Cut_Plane(As,Ab,b,c)