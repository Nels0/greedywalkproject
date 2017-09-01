function [pathelevations, totalcost] = FindPathElevationsAndCost(rows,columns,heights)
%Outputs heights for each step of path, and total cost
%Inputs: rows, columns: sequential path coords
%        heights: heightfield in matrix form
%Outputs: pathElevations: height at each point in path
%         totalcost: sum of height differences between path points

lastheight = heights(rows(1),columns(1));
totalcost = 0;
if length(rows) == length(columns)
    
    for x = 1:length(rows)
        currentheight = heights(rows(x),columns(x));
        pathelevations(x) = currentheight;
        totalcost = totalcost + abs(currentheight - lastheight);
        lastheight = currentheight;
    end
else
    error('Row/Column coordinate vectors length mismatch')
end
end