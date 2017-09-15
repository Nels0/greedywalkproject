function [rows,cols] = GreedyWalk(startpos,easting,heights)
%Traverses a matrix horizontally moving horizontally/diagonally to the
%position with immediate least difference in matrix values
%inputs:    startpos: 1x2 vector for m,n coordinates of starting position
%           easting: +1 traverse west-east, -1 traverse east-west
%           heights: matrix to traveres containing heights
%Outputs:   rows, columns: matched pair of vectors listing route taken by
%                          sequential row and column pairs



%set basic variables
%mstart = startpos(1);
nstart = startpos(2);
[~,width] = size(heights);



%Find number of times to call GreedyPick
if easting == 1
    traverse = abs(nstart-width) + 1;
elseif easting == -1
    traverse = nstart;
else
    %Just in case error handling
    error('Expected easting to be 1 or -1, got %1.0f',easting)
end

rows(1,traverse) = 0;
cols(1,traverse) = 0;
%initialise first position
tpos = startpos;
rows(1) = startpos(1);
cols(1) = startpos(2);

for x = 2:traverse %Call greedypick right number of times (hopefully)
    
    tpos = GreedyPick(tpos,easting,heights);
    rows(x) = tpos(1);
    cols(x) = tpos(2);
end

end