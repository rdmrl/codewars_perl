package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(dir_reduc);
use Data::Dumper qw(Dumper);

# parameter: array_ref; return array_ref
sub dir_reduc {
	my ($input_ref) = @_;

	my @output;

	my @input_arr = @{$input_ref};
	if (scalar @input_arr == 0) {
		return \@output;
	}

	my $input_length = scalar @input_arr - 1;

	my $ix = 0;
	do {
		# Has saved directions.
		if (scalar @output > 0) {
			# Compare with the last saved direction.
			if (cancels_direction($output[$#output], $input_arr[$ix])) {
				pop @output;
			} else {
				push @output, $input_arr[$ix];
			}
		} else {
			# Process the last element.
			if ($ix == $input_length) {
				push @output, $input_arr[$ix];
			} else {
				if (cancels_direction($input_arr[$ix], $input_arr[$ix + 1])) {
					$ix++;
				} else {
					push @output, $input_arr[$ix];
					push @output, $input_arr[$ix + 1];
					$ix++;
				}
			}
		}
		
		$ix++;
	} while ($ix <= $input_length);

	\@output;
}

sub cancels_direction {
	my ($cur_dir, $next_dir) = @_;
	return ($cur_dir eq "NORTH" && $next_dir eq "SOUTH" ||
		$cur_dir eq "SOUTH" && $next_dir eq "NORTH" ||
		$cur_dir eq "WEST" && $next_dir eq "EAST" ||
		$cur_dir eq "EAST" && $next_dir eq "WEST");

	return 0;
}
