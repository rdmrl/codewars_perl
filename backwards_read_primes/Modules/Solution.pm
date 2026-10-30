package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(backwards_prime is_a_prime);

sub backwards_prime {
	my ($start, $end) = @_;

	if ($start < 10) {
		$start = 10;
	}

	my @backwards_primes;
	for (my $ix = $start; $ix <= $end; $ix++) {
		if (is_a_prime($ix)) {
			my $reversed_number = reverse $ix;
			if ($ix ne $reversed_number && is_a_prime($reversed_number)) {
				push @backwards_primes, $ix;
			}
		}
	}
    
    [@backwards_primes];
}

sub is_a_prime {
	my $number = $_[0];

	return 0 if $number <= 2;
	return 0 if $number % 2 == 0;

	# Check only up to the square root of the number.
	for (my $ix = 3; $ix <= int($number ** 0.5) + 1; $ix += 2) {
		return 0 if $number % $ix == 0;
	}

	return 1;
}
