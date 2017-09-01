function [leastElevations] = FindSmallestElevationChange(current,avail) 
%Given number a, and vector b, returns positions of b that have
%least distance from a
%Inputs:    a: float/int current elevation
%           b: array of elevations
%Outputs:   leastElevations: vector referencing positions of

%initialise least distance to a potential value (first element)
mindist = abs(current - avail(1));

%Iterate over avail
for x = 1:length(avail)
    %distance to element x
    tdist = abs(current - avail(x));
    
    if tdist == mindist
        if exist('leastElevations','var') %check vector initialised
            leastElevations(length(leastElevations) + 1) = x; %append pos
        else
            leastElevations(1) = x; %Create vector
        end
    elseif tdist < mindist %we have a new least distance
        mindist = tdist;
        clear leastElevations %stop the presses, throw everything out
        leastElevations(1) = x; %lets start again
    end
end

end