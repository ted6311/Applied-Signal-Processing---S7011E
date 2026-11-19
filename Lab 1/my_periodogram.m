function P = my_periodogram(x,win)
N = length(x);
if nargin == 2
    if strcmp(win,'bartlett')
        w = bartlett(N); % Använder inbyggda funktionerna för att skapa fönstrena
    elseif strcmp(win,'hanning')
        w = hanning(N);
    elseif strcmp(win,'hamming')
        w = hamming(N);
    elseif strcmp(win,'blackman')
        w = blackman(N);
    else
        error('Undefined window function!');
    end
end
x = x(:); % Make sure x is a column vector
w = w(:);
x = x.*w;
% Rest of the code goes here...
P = x;