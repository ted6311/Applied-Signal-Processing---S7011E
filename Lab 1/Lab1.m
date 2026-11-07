clear; clc; 


% X-Matrix 1000x100
load("lab1_data.mat");
% each column = one realization


%% 2.1

[r,k] = my_acs(X);




%% 2.2

% func my_corrmtx(r,p), r is output from my_acs, 
% p = desired size of the correlation matrix. 

p = 4;

% start by sorting first column and first row. 


[R] = my_corrmtx(r,p);