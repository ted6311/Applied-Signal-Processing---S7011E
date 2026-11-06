function [r,k] = my_acs(X)
    N = size(X,2);
    realization = size(X,1);
    r = zeros(2*N-1,1);
    for i = 1:realization
        x = X(:,i);
        for k = 0:2*N-1
            


        end
    end
end
