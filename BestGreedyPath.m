function [rows,columns,elevations] = BestGreedyPath(heights)
%Finds the absolute best greedy path checking the greedy paths
%originating from every point on the matrix
%inputs:    Heights: matrix of heightfield
%outputs:   Rows: row indices in order
%           Columns: column indices in order
%           Elevations: log of heights travelled through

setGlobalx(0)

%the basic stuff
[height, width]  = size(heights);

count = 0;

%Iterate over whole matrix, row at a time
for m = 1:height
    
    %Timing stuff
    fprintf("m = %d\n",m)
    westcount = 0;
    eastcount = 0;
    midcount = 0;
    
    tic
    for n = 1:width
        
        count = count + 1;
        %Impractical to deduplicate calls to GreedyWalk and FindPathElev
        %Setting easting would require a 'split' flag which would
        %reintroduce duplication. This is easier to read
        if n == 1
            
            eastcount = eastcount + 1;
            
            %From the left side, head east
            [trows, tcolumns] = GreedyWalk([m n], 1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
            
        elseif n == width
            
            westcount = westcount + 1;
            
            %From the right side, head west
            [trows, tcolumns] = GreedyWalk([m n], -1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
        else
            
            midcount = midcount + 1;
            
            %From the middle somewhere, go west and east
            %get data heading west
            [trowsW, tcolumnsW] = GreedyWalk([m n], -1, heights);
            [televationsW, tcostW] = FindPathElevationsAndCost(trows,tcolumns,heights);
            %Get data heaading east
            [trowsE, tcolumnsE] = GreedyWalk([m n], 1, heights);
            [televationsE, tcostE] = FindPathElevationsAndCost(trows,tcolumns,heights);     %Concatenate results
            trows = [Reverse(trowsW) trowsE];
            tcolumns = [Reverse(tcolumnsW) tcolumnsE];
            televations = [Reverse(televationsW) televationsE];
            tcost = tcostW + tcostE;
            
        end
        
        %Store results for every position in a 3d cell matrix
        results{m, n, 1} = tcost;
        results{m, n, 2} = trows;
        results{m, n, 3} = tcolumns;
        results{m, n, 4} = televations;
        
        
        
    end
    tot = westcount + midcount + eastcount;
    
    walktime = getGlobalx;
    %fprintf("Avg greedywalktime: %f\n",walktime/tot)
    toc
end

disp(count);

%Create array of costs
costs = cell2mat(results(:,:,1));

%Get minimums for each column and rows each minimum is in
[lowval,midxs] = min(costs);

%Get overall minimum, and column it is in
[lowval2,nidx] = min(lowval);

%Get lowest column index based on lowest row index
midx = midxs(nidx);

%Convert lowest values from cell matrix to proper form and output
rows = cell2mat(results(midx(nidx), nidx, 2));
columns = cell2mat(results(midx(nidx), nidx, 3));
elevations = cell2mat(results(midx(nidx), nidx, 4));

end