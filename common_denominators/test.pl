use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(convert_fracts gcd gcd_euclid);
use Benchmark;

sub array2D_to_string {
    my @arr = @_; my $res = "(";
    for my $row (@arr) {
        $res .= "[" . join(", ", @{$row}) . "], ";
    }
    if ($res eq '(') { return '()'; }
    return substr($res, 0, -2) . ")";
}

=for
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
=cut

sub dotest_gcd {
	my ($n1, $n2, $ans) = @_;
	my $gcd = gcd($n1, $n2);
	# is($gcd, $ans, "Data: res: $gcd, ans: $ans\n");
	is($gcd, $ans, undef);
};

=for
subtest "gcd" => sub {
	dotest_gcd(10, 15, 5);
	dotest_gcd(48, 180, 12);
	dotest_gcd(128, 96, 32);
	dotest_gcd(4789084, 957196, 388);
};
=cut

sub dotest_gcd_euclid {
	my ($n1, $n2, $ans) = @_;
	my $gcd = gcd_euclid($n1, $n2);
	# is($gcd, $ans, "Data: res: $gcd, ans: $ans\n");
	is($gcd, $ans, undef);
};

=for
subtest "gcd_euclid" => sub {
	dotest_gcd_euclid(10, 15, 5);
	dotest_gcd_euclid(48, 180, 12);
	dotest_gcd_euclid(128, 96, 32);
	dotest_gcd_euclid(4789084, 957196, 388);
};
=cut

subtest "benchmark" => sub {
	my @nums;

	push @nums, [20, 25, 5];
	push @nums, [89, 144, 1];
	push @nums, [4789084, 957196, 388];   

	timethese(10_000, {
		'gcd' => sub { dotest_gcd(@$_) for @nums },
		'gcd_euclid' => sub { dotest_gcd_euclid(@$_) for @nums },
	});
};

done_testing();
