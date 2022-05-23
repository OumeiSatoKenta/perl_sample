#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests => 14;
use Date::ICal;

my $unixtime = time;
print $unixtime . "\n";
$unixtime = 0;

# Make sure epoch time is being handled sanely.
#my $t1 = Date::ICal->new( epoch => 0 );
#is( $t1->epoch, 0,    "Epoch time of 0" );
my $t1 = Date::ICal->new( epoch => $unixtime );
is( $t1->epoch, 0,          "Epoch time of 0" );

# XXX This will only work on unix systems.
is( $t1->ical, '19700101Z', "epoch to ical" );

is( $t1->year,  1970,     , " year()" );
is( $t1->month, 1,        , " month()");
is( $t1->day,   1,        , " day()"  );

# like the tests above, but starting with ical instead of epoch
my $t2 = Date::ICal->new( ical => '19700101Z' );
is( $t2->ical, '19700101Z', "Start of epoch in ICal notation" );

is( $t2->epoch, 0,        , " and back to ICal");  

# なぜかepochの設定がミスってperldoc通りの結果にならない
=comment
1..7
not ok 1 - Epoch time of 0
#   Failed test 'Epoch time of 0'
#   at skip.pl line 16.
#          got: '1653320528'
#     expected: '0'
not ok 2 - epoch to ical
#   Failed test 'epoch to ical'
#   at skip.pl line 19.
#          got: '20220523T154208Z'
#     expected: '19700101Z'
not ok 3 -  year()
#   Failed test ' year()'
#   at skip.pl line 21.
#          got: '2022'
#     expected: '1970'
not ok 4 -  month()
#   Failed test ' month()'
#   at skip.pl line 22.
#          got: '5'
#     expected: '1'
not ok 5 -  day()
#   Failed test ' day()'
#   at skip.pl line 23.
#          got: '23'
#     expected: '1'
ok 6 - Start of epoch in ICal notation
not ok 7 -  and back to ICal
#   Failed test ' and back to ICal'
#   at skip.pl line 29.
#          got: '3155760000'
#     expected: '0'
# Looks like you failed 6 tests of 7.

[satoukenta:~/workspace/perl_sample/Test/tutorial][main]$ perl skip.pl
1..7
1653320547
not ok 1 - Epoch time of 0
#   Failed test 'Epoch time of 0'
#   at skip.pl line 16.
#          got: '3155760000'
#     expected: '0'
ok 2 - epoch to ical
ok 3 -  year()
ok 4 -  month()
ok 5 -  day()
ok 6 - Start of epoch in ICal notation
not ok 7 -  and back to ICal
#   Failed test ' and back to ICal'
#   at skip.pl line 29.
#          got: '3155760000'
#     expected: '0'
# Looks like you failed 2 tests of 7.
=cut

my @nums = @ARGV;

SKIP: {
  skip('epoc to ICal not working on MacOS', 6) if @nums[0] eq 'MacOS';
  #skip('epoch to ICal not working on MacOS', 6) if $^O eq 'MacOS';
  is( $t1->ical, '19700101Z', "epoch to ical" );

  is( $t1->year,  1970,     , " year()" );
  is( $t1->month, 1,        , " month()");
  is( $t1->day,   1,        , " day()"  );

  # like the tests above, but starting with ical instead of epoch
  $t2 = Date::ICal->new( ical => '19700101Z' );
  is( $t2->ical, '19700101Z', "Start of epoch in ICal notation" );

  is( $t2->epoch, 0,        , " and back to ICal");  
}