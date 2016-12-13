%% hw8.circular_primes

function cp = circular_primes(max)

cp = 0;
for i = 1:max-1
    if isprime(i)
        potential = 1;
        str = num2str(i);
        len = length(str);
        for j = 1:len
            if ~isprime(str2num(strcat(str(j:len),str(1:j-1))))
                potential = 0;
                break
            end
        end
        cp = cp + potential;
    end
end