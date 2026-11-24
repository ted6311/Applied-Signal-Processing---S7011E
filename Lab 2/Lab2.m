
clear; clc; 

%% 2.1 Noise cancellation with wiener filters

load("wiener_data.mat") % x[n]

% d[n] = desired signal

% v[n] = colored noise

% x[n]= v[n] {0≤n≤1000}, v[n]+d[n] {1001≤n≤2000}


v = x(1:1001);
v = sort(v);
v1 = v(1:500);
v2 = v(502:1001);
v1 = sort(v1);
v2 = flip(sort(v2));
v = [v1; v(501); v2];

n = -500:500;


plot(n,v)