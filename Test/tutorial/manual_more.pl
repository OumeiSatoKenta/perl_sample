#!/usr/bin/perl
use strict;
use warnings;
use Date::ICal;
use Test::More tests => 9;

# マニュアルのテスト、Test::Moreではis()が使える
my $ical = Date::ICal->new( year => 1964, month => 10, day => 16, 
                            hour => 4, min => 12, sec => 47, 
                            tz => '0530' );

ok( defined $ical, 'new() returned something' );
ok( $ical->isa('Date::ICal'), "  and it's the right class");
is( $ical->sec,   47,   ' sec()' );
is( $ical->min,   12,   ' min()' );
is( $ical->hour,  16,   ' hour()' );
is( $ical->day,   16,   ' day()' );
is( $ical->month, 10,   ' month() ');
is( $ical->year,  1964, ' year() ');

# is()を使うことで, 期待している値と、実際の値をメッセージ上で比較することができる。
=comment
1..8
ok 1 - new() returned something
ok 2 -   and it's the right class
ok 3 -  sec()
ok 4 -  min()
not ok 5 -  hour()
#   Failed test ' hour()'
#   at manual_more.pl line 16.
#          got: '19'
#     expected: '16'
not ok 6 -  day()
#   Failed test ' day()'
#   at manual_more.pl line 17.
#          got: '15'
#     expected: '16'
ok 7 -  month() 
ok 8 -  year() 
# Looks like you failed 2 tests of 8.
=cut

my @foo = (5, 10, 15, 20, 25);
print @foo[0] . "\n";
is( @foo, 5, 'foo has 5 elements' ); # 配列に何個あるかテストできる