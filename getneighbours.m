function [M, N, costs] = getneighbours(row,col,heights,height,width)


if nargin <= 3
    [height,width] = size(heights);
end

if col == 0
    N = ones(1,height);
    M = 1:height;
    costs = zeros(1,height);
elseif col == width
    M = -1;
    N = -1;
    costs = -1;
else    
    c_val = heights(row,col);
    c = 0;
    for x = -1:1
        if (row + x) >= 1 && (row + x)
            c = c + 1;
            M(c) = row + x;
            N(c) = col + 1;
            costs(c) = abs(c_val - heights((row + x),(col + 1)));
        end
    end
    
    
    
end