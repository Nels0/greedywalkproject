function [nextpos] = GreedyPick(pos, easting, heights)


row = pos(1);
col = pos(2);

avail = inf(1,3);

for x = 1:3
    try
        avail(x) = heights(row + x - 2, col + easting);
    catch
    end
end

height = heights(row,col);

idx = FindSmallestElevationChange(height,avail);

mnext = row - 2 + idx(1);
nnext = col + easting;

nextpos = [mnext, nnext];

end