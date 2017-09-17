function [rows,columns,elevations] = BestPath(heights)
%Finds the best path from west to east across the heightfield heights
%uses dijkstra's algorithm: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

[height, width] = size(heights);

width = width + 2;

siz = [height width]; %fore use in ind2sub


%heightfield with extra edges added
dheights = [[1; zeros(height-1,1)], heights,[1; zeros(height-1,1)]];


%tracking
unvisited = ones(height,width);
unvisited = logical(unvisited);
cost = inf(height, width);
prevnode = -1 * ones(height, width);

cost(1,1) = 0;


finished = false;
unvisited(:,1) = 0;
unvisited(1,1) = 1;

while ~finished
    
    
    
    %find unvisited node with least distance TO CURRENT NODE
    
    
    tcost = cost(:);
    tcost(~unvisited) = inf;
    [~,leasts] = min(tcost);
    [row,col] = ind2sub(siz,leasts(1));
    
    
    unvisited(row,col) = 0;
    
    
    
    [rows_n, cols_n, costs_n] = getneighbours(row,col,dheights,height,width); %get closest neighbour
    
    
    if col == width - 1
        finished = true;
        break
    else
        for x = 1:length(rows_n)
            t_cost = cost(row,col) + costs_n(x);
            if t_cost < cost(rows_n(x), cols_n(x))
                cost(rows_n(x), cols_n(x)) = t_cost;
                prev(rows_n(x), cols_n(x)) = sub2ind(siz,row,col);
            end
        end
    end
    
    
end
disp(prev)
disp(cost)

[~,step_m] = min(cost(:,width-1));


for x = width-2:-1:1
    rows(x) = step_m;
    columns(x) = x;
    elevations(x) = heights(step_m,x);
    [~, step_m] = ind2sub(siz,prev(step_m,x));
end


