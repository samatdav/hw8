%% hw8.huge_add

function mysum = huge_add(num1, num2)

if sum(isstrprop(strcat(num1,num2),'digit') == 0) > 0 || ~isa(num1,'char') || ~isa(num2,'char')
    mysum = -1;
else
    %Honestly, I was a bit angry at MATLAB for not allowing me to use the 
    %following line for more than 16 digits. Took me an hour to give up on trying to fix the precision.
    %a = num2str((str2num(num1) + str2num(num2)),100);
    if str2num(num1) > str2num(num2)
        mylength = length(num1);
        big = num1(end:-1:1);
        small = num2(end:-1:1);
    else
        mylength = length(num2);
        big = num2(end:-1:1);
        small = num1(end:-1:1);
    end
    
    mysum = '';
    left = 0;
    for i = 1:mylength %flipped column addition
        if i > length(small)
            n1 = 0;
        else
            n1 = str2num(small(i));
        end
        n2 = str2num(big(i));
        summa = n1 + n2 + left;
        if summa > 9
            left = 1;
            mysum = strcat(mysum,num2str(summa-10));
        else
            left = 0;
            mysum = strcat(mysum,num2str(summa));
        end
    end
    mysum = mysum(end:-1:1);
end