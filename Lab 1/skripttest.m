clear clc
load("lab1_data.mat")


%% Hastighetstest
x = X(:);

tic
for i = 1:10
    [r,k] = my_acs(x);
end
t = toc;

fprintf('Average my_acs runtime: %.6f seconds\n', t / 10);

tic
for i = 1:10
    [r,k] = acs2(x);
end
t = toc;
fprintf('Average acs2 runtime: %.6f seconds\n', t / 10);

%% Resultatjämförelse
[rMy, kMy] = my_acs(x);
[rAcs2, kAcs2] = acs2(x);
fprintf('Resultatjämförelse:\n');
fprintf('my_acs: r = %.6f, k = %d\n', norm(rMy), norm(kMy));
fprintf('acs2:   r = %.6f, k = %d\n', norm(rAcs2), norm(kAcs2));