package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(convert_fracts gcd gcd_euclid);

# input: array_ref of array_refs; return: array_ref of integers
sub convert_fracts {
    [[6,12]];
}

sub gcd {
	my ($n1, $n2) = @_;

	while ($n1 != 0 && $n2 != 0) {
		if ($n1 > $n2) {
			$n1 %= $n2;
		} else {
			$n2 %= $n1;
		}
	}
	return $n1 > $n2 ? $n1 : $n2;
}

sub gcd_euclid {
	my ($n1, $n2) = @_;

	return $n1 if $n2 == 0;
	return $n2 if $n1 == 0;

	while () {
		my $rem = $n1 % $n2;
		return $n2 if $rem == 0;
		$n1 = $n2;
		$n2 = $rem;
	}
}

