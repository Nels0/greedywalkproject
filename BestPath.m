function [rows,columns,elevations] = BestPath(heights)
%Finds the best path from west to east across the heightfield heights
%uses dijkstra's algorithm

[height, width] = size(heights);

unvisited = ones(height,width);
costs = inf(height,width);

finished = false;

row = 1;
col = 0;

while ~finished
    t_min
    if col == 0 %set cost of first positions to zero
        costs(:,1) = 0;
    elseif col == width %algorithm finished
        finished = true;
        break
    else
        last_cost = costs(row,col);
        for x = -1:1 %range of visible offsets
            if (row + x) >= 1 && (row + x) <= height %check if offset is in matrix
                %check min distance between 
                t_cost = abs(currentHeight - heights(row + x , col + easting)) + last_cost;
                if t_cost < costs(row + x , col + easting) %We have a new minimum
                    idx = x; %save new minimum offset
                    min = t_min; %save new minimum
                end
            end
        end
    end
    
    
end