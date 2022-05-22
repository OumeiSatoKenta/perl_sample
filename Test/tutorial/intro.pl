#!/usr/bin/perl
use strict;
use warnings;

use Test::Simple tests => 6; #テスト数を指定する
use Date::ICal;
use Data::Dumper;

# ok()内で行われていること
#print "1..1\n";

#print 1 + 1 == 2 ? "ok 1\n" : "not ok 1\n";

# ok()で簡単に書くことができる
ok(1 + 1 == 2);
ok(2 + 2 == 5);
=comment
1..2
ok 1
not ok 2
#   Failed test at test-tutorial.pl line 13.
# Tests were run but no plan was declared and done_testing() was not seen.
=cut

# Date:Icalを使ったもの
my $ical = Date::ICal->new();    # オブジェクトを作成し、
ok( defined $ical );             # 何かを得たかをテストし、
ok( $ical->isa('Date::ICal'));   # そして、正しいクラスかテストする。
print Dumper $ical;

# テストに名前をつける
ok( defined $ical,            'new() returned something' );
ok( $ical->isa('Data::ICal'), "   and it's the right class" );