function [rows,cols] = GreedyWalk(pos,easting,heights)

loop = true;
row_t = pos(1);
col_t = pos(2);
tpos = pos;
x = 1;
while loop
   try
       [tpos] = GreedyPick(tpos, easting, heights); 
       rows(x) = row_t;
       cols(x) = col_t;
       row_t = tpos(1);
       col_t = tpos(2);
       x = x + 1;
   catch
       loop = false;
   end
end

end