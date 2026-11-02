package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(convert_fracts gcd gcd_euclid lcd);

# input: array_ref of array_refs; return: array_ref of integers
sub convert_fracts {
	my ($input) = @_;

	my @output;

	my @nums;
	my @denoms;
	for my $ref1 (@{$input}) {
		my @arr = @{$ref1};
		push @nums, $arr[0];
		push @denoms, $arr[1];
	}

	my $n1 = shift @nums;
	my $n2 = shift @nums;
	my $num_gcd = gcd($n1, $n2);
	for my $num (@nums) {
		$num_gcd = gcd($num_gcd, $num);
	}

	my $dn1 = shift @denoms;
	my $dn2 = shift @denoms;
	my $lcd = lcd($dn1, $dn2);
	for my $denom (@denoms) {
		$lcd = lcd($lcd, $denom);
	}

	if ($lcd % $num_gcd == 0) {
		$lcd /= $num_gcd;
	}

	for my $ref1 (@{$input}) {
		my @arr = @{$ref1};
		push @output, [$arr[0] * $lcd / $arr[1], $lcd];
	}

	\@output;
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

sub lcd {
	my ($n1, $n2) = @_;
	return $n1 * $n2 / gcd_euclid($n1, $n2);
}
