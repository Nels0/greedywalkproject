function [rows,cols] = GreedyWalk(pos,easting,heights, height, width)
%Traverses a matrix horizontally moving horizontally/diagonally to the
%position with immediate least difference in matrix values
%inputs:    startpos: 1x2 vector for m,n coordinates of starting position
%           easting: +1 traverse west-east, -1 traverse east-west
%           heights: matrix to traveres containing heights
%   Optional: height, width: Height/width of heights for optimisation
%Outputs:   rows, columns: matched pair of vectors listing route taken by
%                          sequential row and column pairs

%initialisation
row_t = pos(1);
col_t = pos(2);
t_pos = pos;

if nargin <=3 %optional args not called
    [height,width] = size(heights);
end
%loop the appropriate number of times (distance to walk)
if easting == 1
    traverse = width - col_t + 1; %offset of 1
elseif easting == -1
    traverse = col_t;
    
end

%initliase vectors
rows = zeros(1,traverse);
cols = zeros(1,traverse);

%Set initial values
rows(1) = row_t;
cols(1) = col_t;

%walk across the matrix
for x = 2:traverse %start at pos 2, which is after the first jump
    [t_pos] = GreedyPick(t_pos, easting, heights, height, width);
    rows(x) = t_pos(1);
    cols(x) = t_pos(2);
end

end