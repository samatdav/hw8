%% hw8.day_counter.weekday
%weekday() version
function mondays_first = day_counter(year)

mondays_first = 0;
for i = 1:12
    if weekday(strcat(num2str(i),'-01-',num2str(year))) == 2
        mondays_first = mondays_first + 1;
    end
end

%% hw8.day_counter.no_weekday
% if using weekday() is too easy, here is the version without it
function mondays_first = day_counter(year)

leap_days = 0;
for leap_year = 1776:4:year-1
    if mod(leap_year,100) == 0
        if mod(leap_year,400) == 0
            leap_days = leap_days + 1;
        end
    else
        leap_days = leap_days + 1;
    end
end

jan1_day = mod(2+(year-1776)*365+leap_days, 7); %since 1-Jan-1776 == 2
f29 = 0;
if mod(year,4) == 0
    if mod(year,100) == 0
        if mod(year,400) == 0
            f29 = 1;
        end
    else
        f29 = 1;
    end
end

months = [0, 31, 59+f29, 90+f29, 120+f29, 151+f29, 181+f29, 212+f29, 243+f29, 273+f29, 304+f29, 334+f29];
mondays_first = sum(mod((jan1_day+months),7)==2);     