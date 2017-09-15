function [leastindices] = FindSmallestElevationChange(cheight,nheights)

deltas(1,length(nheights)) = 0;

for x = 1:length(nheights)
    deltas(x) = abs(cheight - nheights(x));
end

 leastindices = find(deltas == min(deltas));
end