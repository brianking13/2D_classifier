function [L] = loss_fun(A,B,x,y,r,N)
L=0;
for i = 1:N
    if A*x(i)+B < y(i)      % if point is above line
        label = 1;
        if label == r(i)    % if labels match
            L = L + 0;  
        else
            L=L+1;
        end
    else                    % if point is below line
        label =-1;
        if label == r(i)    %if labels match
            L = L+0;
        else
            L=L+1;
        end
    end
end
end