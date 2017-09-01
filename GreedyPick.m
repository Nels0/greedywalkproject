function [nextpos] = GreedyPick(currentpos, easting, heights)
%Provides greedy next position.
%Inputs:    currentpos: 1x2 Vector of of current row and column
%           easting: moving east (+1) or west (-1)
%           heights:    Elevation data for the whole matrix/area
%Outputs:   nextpos:    1x2 Vector of next row and column

mpos = currentpos(1); %Current row
npos = currentpos(2); %current column

[height, width] = size(heights); %heightfield size

if mpos == 1 %current position at top of array
    availposes(1) = inf; %Will never return as least distance
    availposes(2) = heights(mpos,npos + easting);
    availposes(3) = heights(mpos + 1, npos + easting);
elseif mpos == height %current position at bottom of array
    availposes(1) = heights(mpos - 1, npos + easting);
    availposes(2) = heights(mpos,npos + easting);
    availposes(3) = inf; %Will never return as least distance
else %generate avail positions automatically
    for x = 1:3
        %disp(x)
        %disp(mpos + easting)
        %disp(npos - 2 + x)
        availposes(x) = heights(mpos - 2 + x, npos + easting);
    end
end

idxnext = FindSmallestElevationChange(heights(mpos,npos),availposes);

%disp(currentpos)
%disp(heights(mpos,npos))
%disp(availposes)
disp(idxnext)

nextpos(1) = mpos - 2 + idxnext(1);
nextpos(2) = npos + easting;

end