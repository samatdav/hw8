%% hw8.smallest_multiple

function a = smallest_multiple(n)

a = uint64(1);
for i = 1:n
    j = 2;
    curr_num = i;
    new_mult = 1;
    existing_mult = 1;
    while j <= curr_num
        if mod(curr_num,j) == 0
            if mod(a/existing_mult,j) == 0
                existing_mult = existing_mult*j; %multiply by the prime, which is absent in prime factorization
            else
                new_mult = new_mult*j;
            end
            curr_num = curr_num/j;
            j = 2;
        else
            j = j + 1;
        end
    end
    if double(a)*new_mult > intmax('uint64')
        a = uint64(0);
        return
    else
        a = a*new_mult;
    end
end