#!/usr/bin/perl
use strict;
use warnings;
use Date::ICal;
use Test::Simple tests => 8;

# マニュアルのテスト、Test::Simple ではokしか使えない
my $ical = Date::ICal->new( year => 1964, month => 10, day => 16, 
                            hour => 4, min => 12, sec => 47, 
                            tz => '0530' );

ok( defined $ical, 'new() returned something' );
ok( $ical->isa('Date::ICal'), "  and it's the right class");
ok( $ical->sec == 47, ' sec()' );
ok( $ical->min == 12, ' min()' );
ok( $ical->hour == 16, ' hour()' );
ok( $ical->day == 16, ' day()' );
ok( $ical->month == 10, ' month() ');
ok( $ical->year == 1964, ' year() ');

# perldocに書かれていないhourもこける
=comment
1..8
ok 1 - new() returned something
ok 2 -   and it's the right class
ok 3 -  sec()
ok 4 -  min()
not ok 5 -  hour()
#   Failed test ' hour()'
#   at manual_simple.pl line 16.
not ok 6 -  day()
#   Failed test ' day()'
#   at manual_simple.pl line 17.
ok 7 -  month() 
ok 8 -  year() 
# Looks like you failed 2 tests of 8.
=cut