function [rows,columns,elevations] = BestGreedyPath(heights)
%Finds the absolute best greedy path checking the greedy paths
%originating from every point on the matrix
%inputs:    Heights: matrix of heightfield
%outputs:   Rows: row indices in order
%           Columns: column indices in order
%           Elevations: sequnce of heights travelled through


%the basic stuff
[height, width]  = size(heights);
%initialise min cost to infinity so any cost will be smaller
mincost = inf;

%Iterate over whole matrix
for m = 1:height
    for n = 1:width
        if n < width %Go east if you can
            [trowsE,tcolsE] = GreedyWalk([m n],1,heights,height,width);
        end
        if n > 1 %Go west if you can
            [trowsW,tcolsW] = GreedyWalk([m n],-1,heights,height,width);
            %put west-heading sequnces the right way around
            trowsW = flip(trowsW);
            tcolsW = flip(tcolsW);
        end
        if n > 1 && n < width %concatenate arrays if necessary
            trows = [trowsW trowsE(2:end)]; %trim duplicate values
            tcols = [tcolsW tcolsE(2:end)];
        elseif n == 1 %otherwise just save values
            trows = trowsE;
            tcols = tcolsE;
        elseif n == width
            trows = trowsW;
            tcols = tcolsW;
        end
        
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
end
end