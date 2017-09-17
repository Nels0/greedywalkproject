%pick = BestGreedyPath(E)
num = 6;
E = peaks(100);
t_x = zeros(1,num);
for x = 1:num
    E = peaks(100);
    tic
    [pathRow,pathCol,pathElev] = BestGreedyPath(E);
    t_(x) = toc;
end
disp(mean(t_))