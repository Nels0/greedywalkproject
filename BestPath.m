function [rows,columns,elevations] = BestPath(heights)
%Finds the best path from west to east across the heightfield heights
%uses dijkstra's algorithm: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

[height, width] = size(heights);

dheights = [[1; zeros(height-1,1)], heights,[1; zeros(height-1,1)]];

disp(dheights)

%tracking
unvisited = ones(height,width + 2);
cost = inf(height, width + 2);
prevnode = -1 * ones(height,width);



[height, width] = size(heights);
finished = false;
unvisited(:,1) = 0;

row = 1;
col = 1;


while ~finished
    disp('beep')
    [rows_n, cols_n, costs_n] = getneighbours(row,col,heights,height,width); %get closest neighbour
    
    if cost(row,col) == inf
        cost(row,col) = 0;
    end
    
    unvisited(row,col) = 0;
    
    if col == width
        finished = true;
        break
    else
        for x = 1:length(rows_n)
            t_cost = cost(row,col) + costs_n(x);
            if t_cost < cost(rows_n(x), cols_n(x))
                cost(rows_n(x), cols_n(x)) = t_cost;
            end
        end
    end
    
    %indices of minimum costs
    asd = (cost(:) == min(cost(:)));
    %qwe = unvisited(:);
    %abc = (qwe == asd);
    
        
    abc = find(unvisited(1:length(asd)) == asd);
    [row,col] = ind2sub([height, width + 2],abc(1));
    
    %leastindices = find(deltas == min(deltas));
    
end
end


