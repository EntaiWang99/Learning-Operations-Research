clc;
clear all;
close all;
L = inf;
f = inf;

% test1:
%  A = [0,9,15,L,L ,L ;
%       L,0,4 ,2,L ,L ;
%       L,L,0 ,L,35,L ;
%       L,2,L ,0,L ,7 ;
%       L,L,16,6,0 ,21;
%       L,L,L ,L,5 ,0 ];
%  
% V = [0 0;1 1;1 -1;2 1;2 -1;3 0];
% fun_SPP_Dijkstra (A,V)

% % test2:
%  A = [0,3,2,f,f,5,f;
%       3,0,1,4,f,f,f;
%       2,1,0,f,2,f,f;
%       f,4,f,0,2,f,4;
%       f,f,2,f,0,3,2;
%       5,f,f,f,3,0,3;
%       f,f,f,4,2,3,0];
%  
% V = [0 -1;0 1;1 0;3 2;4 0;3 -2;5 0];
% 
% begin = 4;
% terminal = 6;
% fun_SPP_Floyd (A,V,begin,terminal)


% test3:
 A = [0 -1 f 2 f 3;
      2  0 4 f 2 f;
      f  3 0 f f -2;
      f  1 f 0 3 f;
      f  f f 2 0 2;
      f  f 3 f -1 0];
 
V = [0 -1;0 1;1 0;3 2;4 0;3 -2];

begin = 1;
terminal = 6;
fun_SPP_Floyd (A,V,begin,terminal)


