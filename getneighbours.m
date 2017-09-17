function [rows, cols, costs] = getneighbours(row,col,heights,height,width)


if nargin <= 3
    [height,width] = size(heights);
end

if col == 1
    cols = ones(1,height);
    rows = 1:height;
    costs = zeros(1,height);
elseif col == width
    rows = -1;
    cols = -1;
    costs = -1;
else    
    c_val = heights(row,col);
    c = 0;
    for x = -1:1
        if (row + x) >= 1 && (row + x) <= height
            c = c + 1;
            rows(c) = row + x;
            cols(c) = col + 1;
            costs(c) = abs(c_val - heights((row + x),(col + 1)));
        end
    end
    
    
    
end