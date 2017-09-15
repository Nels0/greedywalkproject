function [rows,columns,elevations] = BestGreedyPathHeadingEast(heights)
%Finds the best (least cost) path heading from west to east across a
%matrix
%inputs:    Heights: matrix of heightfield
%outputs:   Rows: row indices in order
%           Columns: column indices in order
%           Elevations: log of heights travelled through

[height, width]  = size(heights);

%initialise values to first value
[rows, columns] = GreedyWalk([1 1], 1, heights);
[elevations,cost] = FindPathElevationsAndCost(rows,columns,heights);


for x = 1:height %start at 1 anyway for thoroughness, iterate over start pos's
    [trows, tcolumns] = GreedyWalk([x 1], 1, heights); %Get best greedy path
    %Evaluate cost of best greedy path
    [televations,tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
    if exist('cost','var') && tcost < cost %Set minimum if it's the firt min found
        cost = tcost;
        rows = trows;
        columns = tcolumns;
        elevations = televations;
    end
end