function [revvector] = Reverse(invector)
%Reverses a 1d array
revvector(1,length(invector)) = 0;

for x = 1:length(invector)
    revvector(x) = invector(length(invector)-x + 1);
end
end