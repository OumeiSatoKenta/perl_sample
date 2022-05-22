#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
#use Test::More 'no_plan'; # instead of tests => 32
use Date::ICal;

my %ICal_Dates = (
    # An ICal string And the year, month, date
    #                        hour, minute and second we expect.
    '19971024T120000' => # from the docs.
                         [1997, 10, 24, 12, 0, 0],
    '20390123T232832' => # after the Unix epoch
                         [2039, 1, 23, 23, 28, 32],
    '19671225T000000' => # before the Unix epoch
                         [1967, 12, 25, 00, 00, 00],
    '18990505T232323' => # before the MacOS
                         [1899, 5, 5, 23, 23, 23],
);

#For each key in the hash we're running 8 tests.
#plan tests => keys %ICal_Dates * 8;
my $ICal_Dates_Size =  keys(%ICal_Dates);
plan tests => $ICal_Dates_Size * 8;

while( my($ical_str, $expect) = each %ICal_Dates) {
  my $ical = Date::ICal->new( ical => $ical_str );

  ok( defined $ical, "new(ical => '$ical_str' )" );
  ok( $ical->isa('Date::ICal'), "  and it's the right class" );

  is( $ical->year,    $expect->[0],   ' year()');
  is( $ical->month,    $expect->[1],   ' month()');
  is( $ical->day,    $expect->[2],   ' day()');
  is( $ical->hour,    $expect->[3],   ' hour()');
  is( $ical->min,    $expect->[4],   ' min()');
  is( $ical->sec,    $expect->[5],   ' sec()');
}

# dayのテストでエラーが表示されるテストケースと表示されない場合がある。
=comment
1..32
ok 1 - new(ical => '18990505T232323' )
ok 2 -   and it's the right class
ok 3 -  year()
ok 4 -  month()
ok 5 -  day()
not ok 6 -  hour()
#   Failed test ' hour()'
#   at many_values.pl line 36.
#          got: '14'
#     expected: '23'
ok 7 -  min()
ok 8 -  sec()
ok 9 - new(ical => '19971024T120000' )
ok 10 -   and it's the right class
ok 11 -  year()
ok 12 -  month()
ok 13 -  day()
not ok 14 -  hour()
#   Failed test ' hour()'
#   at many_values.pl line 36.
#          got: '3'
#     expected: '12'
ok 15 -  min()
ok 16 -  sec()
ok 17 - new(ical => '19671225T000000' )
ok 18 -   and it's the right class
ok 19 -  year()
ok 20 -  month()
not ok 21 -  day()
#   Failed test ' day()'
#   at many_values.pl line 35.
#          got: '24'
#     expected: '25'
not ok 22 -  hour()
#   Failed test ' hour()'
#   at many_values.pl line 36.
#          got: '15'
#     expected: '0'
ok 23 -  min()
ok 24 -  sec()
ok 25 - new(ical => '20390123T232832' )
ok 26 -   and it's the right class
ok 27 -  year()
ok 28 -  month()
ok 29 -  day()
not ok 30 -  hour()
#   Failed test ' hour()'
#   at many_values.pl line 36.
#          got: '14'
#     expected: '23'
ok 31 -  min()
ok 32 -  sec()
# Looks like you failed 5 tests of 32.
=cut