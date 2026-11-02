package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(arrange);

use Data::Dumper qw(Dumper);

# input: a string, return : a string
sub arrange {  
	my ($input) = @_;

	return "" if length $input == 0;

	my @words = split(/ /, $input);
	my %word_lengths = map { $_ => length $_ } @words;

	my $word_count = scalar @words;
	return $input if $word_count == 1;

	my $is_up = 1;

	for (my $ix = 0; $ix < $word_count - 1; $ix++) {
		my $cur_word = $words[$ix];
		my $next_word = $words[$ix + 1];

		my $l1 = $word_lengths{$cur_word};
		my $l2 = $word_lengths{$next_word};

		if ($is_up) {
			if ($l1 <= $l2) {
				# do nothing
			} else {
				# swap the words.
				my $temp = $words[$ix];
				$words[$ix] = $words[$ix + 1];
				$words[$ix] = $temp;
			}
		} else {
			if ($l1 <= $l2) {
				# swap the words.
				my $temp = $words[$ix];
				$words[$ix] = $words[$ix + 1];
				$words[$ix] = $temp;
			} else {
				# do nothing
			}
		}

		$is_up != $is_up;
	}

	return join ' ', @words;
}
