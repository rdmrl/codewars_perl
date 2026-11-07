use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(choose_best_sum);

sub testing {
    my ($t, $n, $ts, $exp) = @_;
    my $ans = choose_best_sum($t, $n, $ts);
    is($ans, $exp, "choose_best_sum($t, $n, '$ts')\n");
}

subtest "basics" => sub {
    my $ts = "91, 74, 73, 85, 73, 81, 87";
    testing(230, 3, $ts, 228);
    testing(331, 2, $ts, 178);
    testing(331, 4, $ts, 331);
    testing(331, 5, $ts, -1);
    testing(331, 1, $ts, 91);
};

done_testing();
