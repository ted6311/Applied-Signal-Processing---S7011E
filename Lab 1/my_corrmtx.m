function [R] = my_corrmtx(r,p)

    % Find center
    center = (length(r)+1)/2;
    
    % we go row: r[0], r[1], ..., r[p-1]
    % and column: r[0], r[-1], ..., r[-(p-1)]
    
    c  = r(center:center+p-1);
    r = r(center:-1:center-p+1);
    R = toeplitz(c,r);

end