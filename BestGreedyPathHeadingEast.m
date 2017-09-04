function [rows,columns,elevations] = BestGreedyPathHeadingEast(heights)
%best greedy path ehading east

[height, width]  = size(heights);

%initialise values to first value
[rows, columns] = GreedyWalk([1 1], 1, heights);
[elevations,cost] = FindPathElevationsAndCost(rows,columns,heights);


for x = 1:height 
    [trows, tcolumns] = GreedyWalk([x 1], 1, heights);
    [televations,tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
    if exist('cost','var') && tcost < cost
        cost = tcost;
        rows = trows;
        columns = tcolumns;
        elevations = televations; 
    end
end