package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(dig_pow);

sub dig_pow {
	my ($n, $p) = @_;

	my @digits = split //, $n;
	my $digit_count = scalar @digits;

	my $sum = 0;
	for (my $ix = 0; $ix < $digit_count; $ix++, $p++) {
		$sum += $digits[$ix] ** $p;
	}

	($sum % $n == 0) ? ($sum / $n) : -1;
}
