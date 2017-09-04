function [rows,columns,elevations] = BestGreedyPath(heights)
%FUNCTION HEADER ADN STUFF


%the basic stuff
[height, width]  = size(heights);

for m = 1:height
    for n = 1:width
        if n == 1
            %
            [trows, tcolumns] = GreedyWalk([m n], 1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
        elseif n == width
            [trows, tcolumns] = GreedyWalk([m n], -1, heights);
            [televations, tcost] = FindPathElevationsAndCost(trows,tcolumns,heights);
        else
            %get data heading west
            [trowsW, tcolumnsW] = GreedyWalk([m n], -1, heights);
            [televationsW, tcostW] = FindPathElevationsAndCost(trows,tcolumns,heights);
            %Get data heaading east
            [trowsE, tcolumnsE] = GreedyWalk([m n], 1, heights);
            [televationsE, tcostE] = FindPathElevationsAndCost(trows,tcolumns,heights);
            %Concatenate Results
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
%Get minimums for each column
[lowval,midx] = min(costs);
%Get actual minimum
[lowval2,nidx] = min(lowval);

%midx(nidx) refers to the fuck I forgot already but it works\
%I tried below
%midx is a vector of positions of minimums for each column
%nidx is the position of the minimum of minimums for each column
%midx(nidx) tells the row of the column that has the least minimum
rows = cell2mat(results(midx(nidx), nidx, 2));
columns = cell2mat(results(midx(nidx), nidx, 3));
elevations = cell2mat(results(midx(nidx), nidx, 4));

end