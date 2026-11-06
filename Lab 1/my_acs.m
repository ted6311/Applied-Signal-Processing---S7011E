function [r,k] = my_acs(X)
    realization = size(X,2);
    N = size(X,1);
    r = zeros(2*N-1,1);

    k = -(N-1):N-1; % -999 to 999
    for i = 1:realization
        x = X(:,i);
        for j = 1:length(k)
            lag = k(j);
            
            if lag >= 0
                r(j) = r(j) + sum(x(1:N-lag) .* x(1+lag:N));
            else

                lag = abs(lag);
                r(j) = r(j) + sum(x(1+lag:N) .* x(1:N-lag));
            end    
        end
    end
end
