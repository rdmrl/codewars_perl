package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(max_ball);

use constant G => 9.81;
sub max_ball {
	my $v_in_mps = (shift) / 3.6;

	my $steps = 0;
	my $half_g = 0.5 * G;
	my $t = 0.1;
	my $h = 0;
	my $prev_h = 0;

	while (1) {
		$h = ($v_in_mps * $t) - ($half_g * $t ** 2);
		last if ($h < $prev_h);
		$prev_h = $h;

		$t += 0.1;
		$steps++;
	}

	$steps;
}

