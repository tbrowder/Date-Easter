unit module Date::Easter;

use Date::Event;

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

sub get-easter-events-hashlist(:$year --> Hash) is export {
    
    # full names
    my Date $easter        = Easter $year;
    # my Date $ash-wednesday = $easter.earlier(:46days);
    # my Date $palm-sunday   = $easter.earlier(:7days);
    # my Date $good-friday   = $easter.earlier(:2days);
    # my Date $ascension     = $easter.later(:40days);
    # my Date $pentecost     = $easter.later(:50days);

    # short names
    my Date $eas = Easter $year;
    my Date $ash = $easter.earlier(:46days);
    my Date $pal = $easter.earlier(:7days);
    my Date $goo = $easter.earlier(:2days);
    my Date $asc = $easter.later(:40days);
    my Date $pen = $easter.later(:50days);
    my $nil = 0;

    my Array %h{Date};
    my ($date, $e, $name, $short-name);
    for <easter ash palm good ascension pentecost> {
        when /eas/ {
            $date       = $eas;
            $name       = "Easter Sunday";
            $short-name = "Easter";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
            #say dd $e;
        }
        # <ash palm good ascension pentecost>
        when /ash/ {
            $date       = $ash;
            $name       = "Ash Wednesday";
            $short-name = "Ash Wed.";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
        }
        # <palm good ascension pentecost>
        when /pal/ {
            $date       = $pal;
            $name       = "Palm Sunday";
            $short-name = "Palm Sun.";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
        }
        # <good ascension pentecost>
        when /\h*/ {
            $date       = $goo;
            $name       = "Good Friday";
            $short-name = "Good Fri.";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
        }
        # <ascension pentecost>
        when /asc/ {
            $date       = $asc;
            $name       = "Ascension Day";
            $short-name = "Ascension D.";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
        }
        # <pentecost>
        when /pen/ {
            $date       = $pen;
            $name       = "Pentecost";
            $short-name = "Pentecost";
            $e = Date::Event.new: :$name, :$short-name, :$date, :Etype(12);
            if %h{$date}:exists {
                %h{$date}.push: $e;
            }
            else {
                %h{$date} = [];
                %h{$date}.push: $e;
            }
        }
        default {
            die "FATAL: Unexpected event name '$_'";
        }
    }
    %h;
}

