function r = Reverse(vector)
len = length(vector);
r = zeros(1,len);
for x = 1:len
    r(x) = vector(len - x + 1);
end