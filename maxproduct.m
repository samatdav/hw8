%% hw8.maxproduct

function a = maxproduct(A,n)

[rows, cols] = size(A);
a = [];
max = -inf;

if n <= rows %vertical
    for i = 1:cols
        for j = 1:rows-n+1
            tmax = 1;
            tarr = [];
            for k = 0:n-1
                tmax = tmax * A(j+k,i);
                tarr = vertcat(tarr,[j+k,i]);
            end
            if tmax > max
                max = tmax;
                a = tarr;
            end
        end
    end        
end

if n <= cols %horizonal
    for i = 1:rows
        for j = 1:cols-n+1
            tmax = 1;
            tarr = [];
            for k = 0:n-1
                tmax = tmax * A(i,j+k);
                tarr = vertcat(tarr,[i,j+k]);
            end
            if tmax > max
                max = tmax;
                a = tarr;
            end
        end
    end        
end

if n <= cols && n <= rows %main diagonal
    for i = 1:cols-n+1
        for j = 1:rows-n+1
            tmax = 1;
            tarr = [];
            for k = 0:n-1
                tmax = tmax * A(j+k,i+k);
                tarr = vertcat(tarr,[j+k,i+k]);
            end
            if tmax > max
                max = tmax;
                a = tarr;
            end
        end
    end
end

if n <= cols && n <= rows %inverse diagonal
    for i = 1:cols-n+1
        for j = n:rows
            tmax = 1;
            tarr = [];
            for k = 0:n-1
                tmax = tmax * A(j-k,i+k);
                tarr = vertcat([j-k,i+k],tarr);
            end
            if tmax > max
                max = tmax;
                a = tarr;
            end
        end
    end
end