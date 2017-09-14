function [adjmatrix] = createWeightedAdjMatrix(heights)
%Creates an adjacency matrix with cost as adjacency value
%Inputs:  heights: Matrix height field
%Outputs: adjmatrix: Matrix where value in cell indicates path from row
%           node to column node with cost of the value. Inf indicates no
%           path exists

[inheight,inwidth] = size(heights);
%preallocate array
adjmatrix = inf(inheight*inwidth);


for m = 1:inheight
    for n = 1:inwidth
        row = (m-1) * inheight + n; 
        if n ~= inwidth %not at end
            %set horizontal cost
                tcost = abs(heights(m,n) - heights(m,n+1));
                tcol = (m-1) * inheight + n + 1;
                adjmatrix(row,tcol) = tcost;
            if m ~= 1 %not on top edge
                %set diag up cost
                tcost = abs(heights(m,n) - heights(m-1,n+1));
                tcol = (m-1) * inheight + n;
                adjmatrix(row,tcol) = tcost;
            end
            if m ~= inheight %not on bottom edge
                %set diag down cost
                tcost = abs(heights(m,n) - heights(m + 1,n+1));
                tcol = (m-1) * inheight + n + 2;
                adjmatrix(row,tcol) = tcost;
            end 
        end
    end
end

end