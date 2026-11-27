clear; clc; 

%% EXC 2.2

load("covid_data_Sweden.mat") % contains x, start_date, n

% x = covid-19 cases reported per day
% n = days, i.e. length 690
% start_date = Feb-4-2020


% The data fluctuates quite a lot due to variations in 
% reporting on weekdays and weekends. The underlying 
% situation is therefore better described using a sliding 
% average over seven days.


%% a) seven day MA-filter

h = [1/7 1/7 1/7 1/7 1/7 1/7 1/7];

x_smooth = conv(x, h, "same");

figure; hold on; 
plot(x_smooth,'r-')
plot(x,'b--')
hold off;


%% b)