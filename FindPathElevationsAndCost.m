function [pathElevations, totalCost] = FindPathElevationsAndCost(rows,columns,heights)
%Outputs heights for each step of path, and total cost
%Inputs:  rows, columns: sequential path coords
%         heights: heightfield in matrix form
%Outputs: pathelevations: height at each point in path
%         totalcost: sum of height differences between path points

len = length(rows); %save length(rows) for simplicity
pathElevations = zeros(1,len); %preallocate vector for speed

for x = 1:len
    %store elevations for each row/column pair
    pathElevations(x) = heights(rows(x),columns(x));
end

%create arrays that are shifted by one and trimmed by one
elev1 = [pathElevations(2:end)];
elev2 = [pathElevations(1:end-1)];

%sum absolute differences between shifted matrices
totalCost = sum(abs(elev1 - elev2));