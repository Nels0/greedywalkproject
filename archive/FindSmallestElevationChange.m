function [leastElevations] = FindSmallestElevationChange(current,avail)
%Given number a, and vector b, returns positions of b that have
%least distance from a
%Inputs:    a: float/int current elevation
%           b: array of elevations
%Outputs:   leastElevations: vector referencing positions of

dists(1,length(avail)) = 0;

%Iterate over avail
for x = 1:length(avail)
    %distance to element x
    dists(x) = abs(current - avail(x));    
end

[~,leastElevations] = min(dists);

end