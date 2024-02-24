use Test;
use Date::Easter;

#plan 16;

my $year = 2024;
my %e = get-easter-events-hashlist :$year;
isa-ok %e, Hash;

for %e.kv -> $date, $arr {
    isa-ok $date, Str;
    isa-ok $arr, Array;

    for $arr.kv -> $i, $e {
        isa-ok $e, Date::Event;
        isa-ok $e.date, Date;
        isa-ok $e.name, Str;
        is $e.etype, 'Liturgy';
    }
}

done-testing;

