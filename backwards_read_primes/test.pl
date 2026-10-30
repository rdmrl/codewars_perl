use strict;
use warnings;
use Test::More;

use lib './Modules';
use Solution qw(backwards_prime);

sub testing {
    my ($start, $nd, $exp) = @_;
    my $ans = backwards_prime($start, $nd);
    my $sans = join ", ", @$ans;
    my $sexp = join ", ", @$exp;
    is($sans, $sexp, "Data: $start, $nd\n");
}

subtest "basics" => sub {
    my $a = [13, 17, 31, 37, 71, 73, 79, 97];
    testing(1, 100, $a);
    $a = [13, 17, 31];
    testing(1, 31, $a);
    $a = [107, 113, 149, 157, 167, 179, 199];
    testing(101, 199, $a);
    $a = [311, 337, 347, 359, 389];
    testing(301, 399, $a);
    $a = [];
    testing(501, 599, $a);
    
};

done_testing();
