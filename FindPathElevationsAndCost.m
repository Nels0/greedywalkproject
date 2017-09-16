function [pathElevations, totalCost] = FindPathElevationsAndCost(rows,columns,heights)
%Outputs heights for each step of path, and total cost
%Inputs:  rows, columns: sequential path coords
%         heights: heightfield in matrix form
%Outputs: pathelevations: height at each point in path
%         totalcost: sum of height differences between path points

len = length(rows);

pathElevations = zeros(1,len);
for x = 1:len
    pathElevations(x) = heights(rows(x),columns(x));
end

elev1 = [pathElevations(2:end)];
elev2 = [pathElevations(1:end-1)];

totalCost = sum(abs(elev1 - elev2));