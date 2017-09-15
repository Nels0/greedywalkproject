function [reversed_vector] = Reverse(vector)
%Reverses a 1d array
%Input: Vector (1xn matrix)
%Output: Vector in reverse order

%iniitalise last element of reversed_vector
%Matlab fills in the rest with zero
reversed_vector(1,length(vector)) = 0;


%Iterate over whole vector
for x = 1:length(vector)
    %set x of reverse vector to reverse of vector
    reversed_vector(x) = vector(length(vector)-x + 1);
end
end