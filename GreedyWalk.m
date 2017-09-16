function [rows,cols] = GreedyWalk(pos,easting,heights)

row_t = pos(1);
col_t = pos(2);
t_pos = pos;

[~,width] = size(heights);

if easting == 1
    traverse = width - col_t + 1;
elseif easting == -1
    traverse = col_t;
    
end

rows = zeros(1,traverse);
cols = zeros(1,traverse);

rows(1) = row_t;
cols(1) = col_t;

for x = 2:traverse
    [t_pos] = GreedyPick(t_pos, easting, heights);
    rows(x) = t_pos(1);
    cols(x) = t_pos(2);
end

end