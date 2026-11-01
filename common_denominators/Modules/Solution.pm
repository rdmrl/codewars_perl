package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(convert_fracts gcd);

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
	return max [$n1, $n2];
}
