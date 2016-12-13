%% hw8.digit_counter

function digits = digit_counter(fname)

fid = fopen(fname, 'r');
if fid < 0
    digits = -1;
    return
end

digits = 0;
line = fgets(fid);
while ischar(line)
    digits = digits + sum(isstrprop(line,'digit'));
    line = fgets(fid);
end

fclose(fid);