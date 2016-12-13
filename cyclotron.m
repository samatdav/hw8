%% hw8.cyclotron

function [E,N] = cyclotron(V)

m = 3.344e-27;
q = 1.603e-19;
B = 1.600;
r1 = sqrt((m*V)/(q*B^2));
n = 0;
r = r1;
s0 = r1/2;
position = -s0;

while position >= -0.5
    if mod(n,2) == 0
        position = position + 2*r;
    else
        position = position - 2*r;
    end
    r = sqrt(r^2 + (2*m*V)/(q*B^2));
    n = n + 1;
end

N = n;
E = V*N*1e-6;