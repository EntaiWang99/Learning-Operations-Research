%%%%%%%%%% parameter %%%%%%%%%
clc;
clear all;
close all;

M = inf;
V = [0,0;2,0;4,0;2,2;4,2;6,0];
C = [ 0,10, M, 4, M, M;
      M, 0,13, M, 4, M;
      M, M, 0, M, M,10;
      M, M, 4, 0, M, M;
      M, M, M, M, 0, 4;
      M, M, M, M, M, 0];
E = m_transMatrix(C);
E = m_transMatrixNoD(C);

m_grPlot(V,E,'d','%d','%d');
title('initialization graph');

m = size(C,1);
F =  [ 0, 0, 0, 0, M, M;
       M, 0, 0, M, 0, M;
       M, M, 0, M, M, 0;
       M, M, 0, 0, M, M;
       M, M, M, M, 0, 0;
       M, M, M, M, M, 0];
E = m_transMatrix(F);
m_grPlot(V,E,'d','%d','%d');
title('flow graph');
function_MAX_Flow_Problem (C,F,V)