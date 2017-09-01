function [rows,columns] = GreedyWalk(startpos,easting,heights)
%Traverses a matrix horizontally moving horizontally/diagonally by
%immediate least difference in matrix values
%inputs: startpos: 1x2 vector for m,n coordinates of starting position
%        easting: +1 traverse west-east, -1 traverse east-west
%        heights: matrix to traveres containing heights
%Outputs: rows, columns: matched pair of vectors listing route taken by
%         sequential row and column pairs

mstart = startpos(1);
nstart = startpos(2);
[height,width] = size(heights);

tpos = startpos;
rows(1) = startpos(1);
columns(1) = startpos(1);

for x = 2:(abs(nstart-width) + 2)
    tpos = GreedyPick(tpos,easting,heights);
    rows(x) = tpos(1);
    columns(x) = tpos(2);
end
    
end