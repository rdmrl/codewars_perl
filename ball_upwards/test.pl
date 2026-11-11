use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(max_ball);

sub dotest {
    my ($v0, $exp) = @_;
    my $ans = max_ball($v0);
    is($ans, $exp, "");
}

subtest "basics" => sub {
    dotest(37, 10);
    dotest(45, 13);
    dotest(99, 28);
    dotest(85, 24);
    dotest(136, 39);
};

done_testing();
