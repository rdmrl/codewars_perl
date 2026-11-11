package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(max_ball);

use constant G => 9.81;
sub max_ball {
    my ($v0) = @_;

	my $v_in_mps = $v0 / 3.6;

	my $steps = 0;
	my $half_g = 0.5 * G;
	my $t = 0.1;
	my $h = 0;
	my $prev_h = 0;

	while ($h >= 0) {
		$prev_h = $h;
		$h = ($v_in_mps * $t) - ($half_g * $t ** 2);

		$t += 0.1;

		if ($h > $prev_h) {
			$steps++;
		} else {
			last;
		}
	}

	$steps;
}

