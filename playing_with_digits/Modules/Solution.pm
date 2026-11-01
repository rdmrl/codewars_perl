package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(dig_pow);

sub dig_pow {
	my ($n, $p) = @_;

	my @digits = split //, $n;

	my $sum = 0;
	for my $i (0 .. $#digits) {
		$sum += $digits[$i] ** ($p + $i);
	}

	($sum % $n == 0) ? ($sum / $n) : -1;
}
