function [rows,columns,elevations] = BestGreedyPath(heights)
%Finds the absolute best greedy path checking the greedy paths
%originating from every point on the matrix
%inputs:    Heights: matrix of heightfield
%outputs:   Rows: row indices in order
%           Columns: column indices in order
%           Elevations: log of heights travelled through


%the basic stuff
[height, width]  = size(heights);

mincost = inf;

for m = 1:height
    for n = 1:width
        if n < width
            [trowsE,tcolsE] = GreedyWalk([m n],1,heights);
        end
        if n > 1
            [trowsW,tcolsW] = GreedyWalk([m n],-1,heights);
            trowsW = flip(trowsW);
            tcolsW = flip(tcolsW);
        end
        if n > 1 && n < width
            trows = [trowsW trowsE];
            tcols = [tcolsW tcolsE];
        elseif n == 1
            trows = trowsE;
            tcols = tcolsE;
        elseif n == width
            trows = trowsW;
            tcols = tcolsW;
        end
        
        [televations, tcost] = FindPathElevationsAndCost(trows,tcols,heights);
        
        if tcost < mincost
            rows = trows;
            columns = tcols;
            elevations = televations;
        end            
    end
end
end