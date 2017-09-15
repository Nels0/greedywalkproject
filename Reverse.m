function r = Reverse(vector)
[height, width] = size(vector);
r = zeros(height,width);
if height == 1
    for x = 1:width
        r(x) = vector(width - x + 1);
    end
elseif width == 1
    for x = 1:height
        r(x,1) = vector(height - x + 1);
    end
end