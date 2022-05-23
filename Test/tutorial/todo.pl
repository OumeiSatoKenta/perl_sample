#!/usr/bin/perl
#use strict;
#use warnings;

use Test::More tests => 1;
use Date::ICal;

my $ical = Date::ICal->new;
$ical->ical('20201231Z');
#is( $ical->ical, '202201231Z',   'Setting via ical()' );

# 現状実装されていないので、テストは失敗してしまう。
=comment
1..1
Bad args: expected named parameter list at todo.pl line 9.
not ok 1 - Setting via ical()
#   Failed test 'Setting via ical()'
#   at todo.pl line 10.
#          got: '20220523T161613Z'
#     expected: '202201231Z'
# Looks like you failed 1 test of 1.
=cut

# 実装されていない場合、TODOとして残しておきたい場合は下のように実装すると、こけたメッセージは出ない
TODO: {
  local $TODO = 'ical($ical) not yet implemented';

  $ical = Date::ICal->new;
  
  $ical->ical('20201231Z');
  is( $ical->ical, '202201231Z',   'Setting via ical()' );
}

# 最後にLooks like you failed 1 test of 1.というメッセージが出ずに、失敗したテストでも成功したように扱う。
=comment
not ok 1 - Setting via ical() # TODO ical($ical) not yet implemented
#   Failed (TODO) test 'Setting via ical()'
#   at todo.pl line 31.
#          got: '20220523T162146Z'
#     expected: '202201231Z'
=cut
