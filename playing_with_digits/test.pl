use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(dig_pow);

sub dotest {
    my ($n, $p, $exp) = @_;
    my $ans = dig_pow($n, $p);
    is($ans, $exp, "data: $n, $p\n");
}

subtest "basics" => sub {
    dotest(89, 1, 1);
    dotest(92, 1, -1);
    dotest(46288, 3, 51);
    dotest(114, 3, 9);
    dotest(46288, 5, -1);
};

done_testing();
