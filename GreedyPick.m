function [nextpos] = GreedyPick(pos, easting, heights, height, width)
%Provides greedy next position.
%Inputs:    currentpos: 1x2 Vector of of current row and column
%           easting:    Moving east (+1) or west (-1)
%           heights:    Elevation data for the whole matrix/area
%Outputs:   nextpos:    1x2 Vector of next row and column

%Fetch size if not optionally passed
if nargin <= 3
    [height,width] = size(heights);
end

row = pos(1);
col = pos(2);
currentHeight = heights(row,col); %cache current height
min = inf; %anything will be smaller than infinity

%Throw proper out of bounds error
if (col + easting) > width || col + easting <1
    error("Resulting column is outside array bounds")
end

for x = -1:1 %range of visible offsets
    if (row + x) >= 1 && (row + x) <= height %check if offset is in matrix
        %check min distance between
        t_min = abs(currentHeight - heights(row + x , col + easting));
        if t_min < min %We have a new minimum
            idx = x; %save new minimum offset
            min = t_min; %save new minimum
        end
    end
end

%set results
mnext = row + idx;
nnext = col + easting;
%concatenate
nextpos = [mnext, nnext];

end