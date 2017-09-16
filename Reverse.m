function r = Reverse(vector)
%Reverses a 1d array, like flip() but for only 1d vectors
%Input: Vector (1xn or nx1 matrix)
%Output: Vector in reverse order (same dimension as input matrix)


[height, width] = size(vector);
%initialise array to same size for speed
r = zeros(height,width);

if height == 1 %row vector
    for x = 1:width
        r(x) = vector(width - x + 1);   %set xth element of out to
                                        %xth from the end of input array
    end
elseif width == 1 %column vector
    for x = 1:height
        r(x,1) = vector(height - x + 1);%set xth element of out to
                                        %xth from the end of input array
    end
end