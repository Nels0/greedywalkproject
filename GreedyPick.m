function [nextpos] = GreedyPick(currentpos, easting, heights)
%Provides greedy next position.
%Inputs:    currentpos: 1x2 Vector of of current row and column
%           easting: moving east (+1) or west (-1)
%           heights:    Elevation data for the whole matrix/area
%Outputs:   nextpos:    1x2 Vector of next row and column

mpos = currentpos(1);
npos = currentpos(2);


%NEEDS HANDLING FOR EDGE CASES, i.e when you're at the top or bottom
for x = 1:3
    availposes(x) = heights(mpos + easting, npos - 2 + x)
end

nextnpos = FindSmallestElevationChange(heights(mpos,npos),availposes);
disp(nextnpos)


end