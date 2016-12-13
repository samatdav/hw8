%% hw8.number2letters

function a = number2letters(num)

hundreds = floor(num/100);
tens = floor((num-(hundreds*100))/10);
units = mod(num,10);
letters_up_ten = [0,3,3,5,4,4,3,5,5,4];
letters_up_twenty = [3,6,6,8,8,7,7,9,8,8];
letters_up_hundred = [0,6,6,5,5,5,7,6,6];

unit = letters_up_ten(units+1);
if tens == 0
   ten = 0;
elseif tens == 1
    ten = letters_up_twenty(units+1);
    unit = 0;
else
    ten = letters_up_hundred(tens);
end

hundr = 0;
if hundreds > 0
    hundr = 7; %word "hundred"
end

a = letters_up_ten(hundreds+1) + hundr + ten + unit;