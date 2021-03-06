function [nextpos] = GreedyPick(currentpos, easting, heights)
%Provides greedy next position.
%Inputs:    currentpos: 1x2 Vector of of current row and column
%           easting:    Moving east (+1) or west (-1)
%           heights:    Elevation data for the whole matrix/area
%Outputs:   nextpos:    1x2 Vector of next row and column

mpos = currentpos(1); %Current row
npos = currentpos(2); %current column

[height, ~] = size(heights); %heightfield size

availposes = inf(1,3);
if mpos == 1 %current position at top of array
    %Manually get values with offset
    availposes(2) = heights(mpos,npos + easting);
    availposes(3) = heights(mpos + 1, npos + easting);
elseif mpos == height %current position at bottom of array
    %Manually get values with offset
    availposes(1) = heights(mpos - 1, npos + easting);
    availposes(2) = heights(mpos,npos + easting);
else %generate avail positions automatically
    for x = 1:3
        availposes(x) = heights(mpos - 2 + x, npos + easting);
    end
end

%Get the indexes of availposes that are least distances
idxnext = FindSmallestElevationChange(heights(mpos,npos),availposes);

%M-position set based on position
nextpos(1) = mpos - 2 + idxnext(1);
%N-position set based on easting
nextpos(2) = npos + easting;

end