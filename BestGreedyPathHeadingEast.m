function [rows,columns,elevations] = BestGreedyPathHeadingEast(heights)
%Finds the best (least cost) path heading from west to east across a
%matrix
%inputs:    Heights: matrix of heightfield
%outputs:   Rows: row indices in order
%           Columns: column indices in order
%           Elevations: log of heights travelled through

[height, width]  = size(heights);

mincost = inf;

for x = 1:height %iterate over start pos's
    [trows, tcols] = GreedyWalk([x 1], 1, heights); %Get best greedy path
    %check cost
    [televations, tcost] = FindPathElevationsAndCost(trows,tcols,heights);
    
    %save output if the current path is the cheapest one
    if tcost < mincost
        rows = trows;
        columns = tcols;
        elevations = televations;
        mincost = tcost;
    end
end