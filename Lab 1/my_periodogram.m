function P = my_periodogram(x,win)
N = length(x);
if nargin == 2
    if strcmp(win,'bartlett')
        w = bartlett(x) % insert code here
    elseif strcmp(win,'hanning')
        w = hanning(x) % insert code here
    elseif strcmp(win,'hamming')
        w = hamming(x)
    elseif strcmp(win,'blackman')
        w = blackman(x)
    else
        error('Undefined window function!');
    end
end
x = x(:); % Make sure x is a column vector
w = w(:);
x = x.*w;
% Rest of the code goes here...
P = ...