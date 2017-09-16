function [leastindices] = FindSmallestElevationChange(cheight,nheights)

deltas = zeros(1,length(nheights));

for x = 1:length(nheights)
    deltas(x) = abs(cheight - nheights(x));
end

 leastindices = find(deltas == min(deltas));
end