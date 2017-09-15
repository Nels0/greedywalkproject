function [pathelevations, totalcost] = FindPathElevationsAndCost(rows,columns,heights)
%Outputs heights for each step of path, and total cost
%Inputs:  rows, columns: sequential path coords
%         heights: heightfield in matrix form
%Outputs: pathelevations: height at each point in path
%         totalcost: sum of height differences between path points


%initialise
lastheight = heights(rows(1),columns(1));
totalcost = 0;

pathelevations = zeros(1,length(rows));%Preallocate vector for speed

if length(rows) == length(columns) %give clear error messages in case
    
    for x = 1:length(rows) %iterate over coord
        currentheight = heights(rows(x),columns(x)); %get current height
        pathelevations(x) = currentheight; %log heights
        totalcost = totalcost + abs(currentheight - lastheight); %update cost
        lastheight = currentheight; %for finding height delta
    end
else
    
    error('Row/Column coordinate vectors length mismatch')
end
end