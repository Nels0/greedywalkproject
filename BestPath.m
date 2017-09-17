function [rows,columns,elevations] = BestPath(heights)
%Finds the best path from west to east across the heightfield heights
%uses dijkstra's algorithm: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm

[height, width] = size(heights);

%::1 is whether node visited
%::2 is distance from origin
%::3 is prev node
dcells = cell(height,width,3);

%initalise cell values
dcells(:,:,1) = 0;
dcells(:,:,2 = inf;
dcells(:,:,3) = "undefined";

%set
dcells(:,1,3) = "start";

finished = false;

row = 1;
col = 0;

while ~finished
    for x = 1:2
        
        [row_u, col_u] = getclosestneighbour(row,col,heights,height,width,dcells); %get closest neighbour
        
    end
end
end


