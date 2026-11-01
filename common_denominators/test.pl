use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(convert_fracts gcd);

sub array2D_to_string {
    my @arr = @_; my $res = "(";
    for my $row (@arr) {
        $res .= "[" . join(", ", @{$row}) . "], ";
    }
    if ($res eq '(') { return '()'; }
    return substr($res, 0, -2) . ")";
}

sub dotest {
    my ($l, $exp) = @_;
    my $ans = convert_fracts($l);
    my $sans = array2D_to_string(@$ans);
    my $sexp = array2D_to_string(@$exp);;
    my $data = array2D_to_string(@$l);
    is($sans, $sexp, "Data: $data\n");
}

subtest "basics" => sub {
    dotest([[2, 4], [2, 6], [2, 8]], [[6,12], [4,12], [3,12]]);
    dotest([[69, 130], [87, 1310], [3, 4]], [[18078,34060], [2262,34060], [25545,34060]]);
    dotest([[77, 130], [84, 131], [3, 4]], [[20174,34060], [21840,34060], [25545,34060]]);
};

sub dotest_gcd {
	my ($n1, $n2, $ans) = @_;
	$gcd = gcd($n1, $n2);
	is($gcd, $ans, "Data: res: $gcd, ans: $ans\n");
}

subtest "gcd" => sub {
	dotest_gcd([10, 15, 5]);
}

done_testing();
