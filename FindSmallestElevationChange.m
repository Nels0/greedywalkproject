function [leastindices] = FindSmallestElevationChange(cheight,nheights)
%Given number a, and vector b, returns positions of b that have
%least distance from a
%Inputs:    a: float/int current elevation
%           b: array of elevations
%Outputs:   leastElevations: vector of indices of least distance values

deltas = zeros(1,length(nheights)); %preallocate height differences

for x = 1:length(nheights)
    %calculate min height differences
    deltas(x) = abs(cheight - nheights(x));
end

%find indices where values are minimum
leastindices = find(deltas == min(deltas));
end