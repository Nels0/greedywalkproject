function [nextpos] = GreedyPick(pos, easting, heights)

[height,width] = size(heights);
row = pos(1);
col = pos(2);
currentHeight = heights(row,col);
min = inf;

for x = -1:1
    if (row + x) >= 1 && (row + x) <= height %...
            %&& col + easting >= 1 && col + easting <= width
        t_min = abs(currentHeight - heights(row + x , col + easting));
        if t_min < min
            idx = x;
            min = t_min;
        end
    else
        
    end
end

%height = heights(row,col);

%idx = FindSmallestElevationChange(height,avail);

mnext = row + idx;
nnext = col + easting;

nextpos = [mnext, nnext];

end