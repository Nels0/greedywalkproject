function [rows,columns,elevations] = BestGreedyPath(heights)
%FUNCTION HEADER ADN STUFF


%the basic stuff
[height, width]  = size(heights);

%Iterate over whole matrix, row at a time
for m = 1:height
    for n = 1:width
        %Impractical to deduplicate calls to GreedyWalk and FindPathElev
        if n == 1
            %From the left side, head east
            [trows, tcolumns] = GreedyWalk([m n], 1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
        elseif n == width
            %From the right side, head west
            [trows, tcolumns] = GreedyWalk([m n], -1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
        else
            %From the middle somewhere, go west and east
            %get data heading west
            [trowsW, tcolumnsW] = GreedyWalk([m n], -1, heights);
            [televationsW, tcostW] = FindPathElevationsAndCost(trows,tcolumns,heights);
            %Get data heaading east
            [trowsE, tcolumnsE] = GreedyWalk([m n], 1, heights);
            [televationsE, tcostE] = FindPathElevationsAndCost(trows,tcolumns,heights);
            %Concatenate results
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

end

%Create array of costs
costs = cell2mat(results(:,:,1));

%Get minimums for each column and rows each minimum is in
[lowval,midxs] = min(costs);

%Get overall minimum, and column it is in
[lowval2,nidx] = min(lowval);

%Get lowest column index based on lowest row index
midx = midxs(nidx);


rows = cell2mat(results(midx(nidx), nidx, 2));
columns = cell2mat(results(midx(nidx), nidx, 3));
elevations = cell2mat(results(midx(nidx), nidx, 4));

end