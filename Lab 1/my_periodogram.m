function P = my_periodogram(x,win)
N = length(x);

x = x(:); % Make sure x is a column vector

if nargin == 2
    if strcmpi(win,'bartlett')
        w = bartlett(N); % Använder inbyggda funktionerna för att skapa fönstrena
    elseif strcmpi(win,'hanning')
        w = hanning(N);
    elseif strcmpi(win,'hamming')
        w = hamming(N);
    elseif strcmpi(win,'blackman')
        w = blackman(N);
    else
        error('Undefined window function!');
    end
end

w = w(:);

x2 = x.*w; % Apply the window scaling to the sample vector, multiplication in time domain.

[r,~] = my_acs(x2); % Calculate the new window scaled correlation factors

P = fft(r); % perform DFT on the correlation factors and return the resulting periodogram.