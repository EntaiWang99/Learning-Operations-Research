clc;
clear all;
close all;

% %Example 1
% G1 = [0 5 6 0 0 0;
%      5 0 1 2 7 0;
%      6 1 0 0 5 0;
%      0 2 0 0 3 4;
%      0 7 5 3 0 4;
%      0 0 0 4 4 0];
% V1 = [0 0;1 -1;1 1;2 -1;2 1;3 0];
% 
% fun_min_support_tree_avoid_loop_method(G1,V1)

%Example 2
% f = inf;
% G2 = [0,43,27,f,f,f,f;
%      43,0,28,20,f,f,24;
%      27,28,0,26,14,f,f;
%      f,20,26,0,19,18,f;
%      f,f,14,19,0,24,f;
%      f,f,f,18,24,0,22;
%      f,24,f,f,f,22,0];
%  
% V2 = [0 0;1 1;1 -1;2 0;3 -1;4 0;3 1];
% fun_min_support_tree_anti_loop_method(G2,V2)
%
%Example 3
% f = inf;
% G3 = [0,3,3,f,f,f,f;
%      43,0,28,20,f,f,24;
%      27,28,0,26,14,f,f;
%      f,20,26,0,19,18,f;
%      f,f,14,19,0,24,f;
%      f,f,f,18,24,0,22;
%      f,24,f,f,f,22,0];
%  
% V3 = [0 0;1 1;1 -1;2 0;3 -1;4 0;3 1];
% fun_min_support_tree_anti_loop_method(G3,V3)

%Homework 1
f = inf;
G4 = [0,3,2,f,f,5,f;
      3,0,1,4,f,f,f;
      2,1,0,f,2,f,f;
      f,4,f,0,2,f,4;
      f,f,2,f,0,3,2;
      5,f,f,f,3,0,3;
      f,f,f,4,2,3,0];
 
V4 = [0 -1;0 1;1 0;3 2;4 0;3 -2;5 0];
%fun_min_support_tree_anti_loop_method(G4,V4)
fun_min_support_tree_avoid_loop_method(G4,V4)

% Homework 2
f = inf;
G5 = [0,2,2,f,f,f,f,f,f,f;
      2,0,3,2,f,f,f,5,f,f;
      2,3,0,f,2,f,f,f,5,f;
      f,2,f,0,1,3,f,f,f,f;
      f,f,2,1,0,f,3,f,f,f;
      f,f,f,3,f,0,1,2,f,f;
      f,f,f,f,3,1,0,f,2,f;
      f,5,f,f,f,2,f,0,4,2;
      f,f,5,f,f,f,2,4,0,2;
      f,f,f,f,f,f,f,2,2,0];
 
V5 = [0 0;2 2;2 -2;4 1;4 -1;6 1;6 -1;8 2;8 -2;10 0];
% fun_min_support_tree_anti_loop_method(G5,V5)
%fun_min_support_tree_avoid_loop_method(G5,V5)