function [r,k] = acs2(X)
    Ncols = size(X,2);
    Nrows = size(X,1);
    r = zeros(2*Nrows-1,1);
    k = -(Nrows-1):Nrows-1;
    for i = 1:Ncols
        x = X(:,i);
        xstar = flip(x);
        r = r + conv(x,xstar);
    end
end