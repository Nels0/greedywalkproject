function [nextpos] = GreedyPick(pos, easting, heights)

[height,~] = size(heights);
row = pos(1);
col = pos(2);
cheight = heights(row,col);
%avail = inf(1,3);
tmin = inf;

for x = 1:3
    if (row + x - 2) > 1 && (row + x - 2) <= height
        %disp("bong")
        %avail(x) = heights(row + x - 2, col + easting);
        tm = row + x - 2;
        tn = col + easting;
        tavail = heights(tm,tn);
        cdistance = abs(cheight - tavail);
        if cdistance < tmin
            %disp("bing")
            idx = x;
        end
    end
end

%height = heights(row,col);

%idx = FindSmallestElevationChange(height,avail);

mnext = row - 2 + idx;
nnext = col + easting;

nextpos = [mnext, nnext];

end