package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(convert_fracts gcd gcd_euclid lcd);

# input: array_ref of array_refs; return: array_ref of integers
sub convert_fracts {
	my ($input) = @_;

	my $lcd = 1;
	for my $ref1 (@{$input}) {
		my @arr = @{$ref1};
		$lcd = lcd($lcd, $arr[1]);
	}

	my @output;
	for my $ref1 (@{$input}) {
		my @arr = @{$ref1};
		push @output, [$arr[0] * $lcd / $arr[1], $lcd];
	}

	# Check if the fraction can be further reduced.
	my $num_gcd = 0;
	for my $arr1 (@output) {
		$num_gcd = gcd_euclid($num_gcd, @{$arr1}[0]);
	}

	# To reduce the fraction.
	if ($lcd % $num_gcd == 0) {
		my $new_lcd = $lcd / $num_gcd;

		my @new_output;
		for my $arr2 (@output) {
			push @new_output, [@{$arr2}[0] / $num_gcd, $new_lcd];
		}
		\@new_output;
	} else {
		\@output;
	}
}

sub gcd2 {
	my ($n1, $n2) = @_;

	return $n1 if $n2 == 0;
	return $n2 if $n1 == 0;

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
