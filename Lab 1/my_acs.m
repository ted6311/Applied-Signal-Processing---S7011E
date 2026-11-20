function [r,k] = my_acs(X)
    Ncols = size(X,2);
    Nrows = size(X,1);
    r = zeros(2*Nrows-1,1); % Pre-allocation of memory
    k = -(Nrows-1):Nrows-1; 
    for i = 1:Ncols
        x = X(:,i);
        xstar = flip(x);
        r = r + conv(x,xstar); % Convolution of x and x*
    end
    r = r./Nrows./Ncols; % Normalize the resulting autocorrelation factors
end