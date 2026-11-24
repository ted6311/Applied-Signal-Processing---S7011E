
clear; clc; 

%% 2.1 Noise cancellation with wiener filters

load("wiener_data.mat") % x[n]

% d[n] = desired signal

% v[n] = colored noise

% x[n]= v[n] {0≤n≤1000}, v[n]+d[n] {1001≤n≤2000}


v = x(1:1000);