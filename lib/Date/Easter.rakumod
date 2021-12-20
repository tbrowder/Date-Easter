unit module Date::Easter;

# This returns the date Easter occurs on for a given year as a Date
# object.  Coded directly from the Calender FAQ
# (https://tondering.dk/claus/calendar.html)
# Easter in the Gregorian calendar
sub Easter(Int \year --> Date) is export {
    my \G = year mod 19;
    my \C = year div 100;
    my \H = (C - (C div 4) - (8*C + 13) div 25 + 19*G + 15) mod 30;
    my \I = H - (H div 28) * (1 - (29 div (H + 1)) * (21 - G) div 11);
    my \J = (year + year div 4 + I + 2 - C + C div 4) mod 7;
    my \L = I - J;
    my \EasterMonth = 3 + (L + 40) div 44;
    my \EasterDay = L + 28 - 31 * (EasterMonth div 4);
    Date.new(year, EasterMonth, EasterDay)
}
