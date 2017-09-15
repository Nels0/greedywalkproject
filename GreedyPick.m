function [nextpos] = GreedyPick(pos, easting, heights)

%pos(1) = row
%pos(2) = column

m = pos(1);
n = pos(2);

avail = inf(1,3);

for x = 1:3
   try
        avail(x) = heights(m + easting, n - 2 + x);
   catch
   end
end

height = heights(m,n);

FindSmallestElevationChange(height,avail);

[~,idxmin] = min(avail);

mnext = n - 2 + idxmin;
nnext = m + easting;

nextpos = [nnext, mnext];

end