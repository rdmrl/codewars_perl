package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(choose_best_sum get_combinations);
use Data::Dumper qw(Dumper);

# parameter: maximum sum of distances, number of towns to visit, string of distances
sub choose_best_sum {
	my ($max_sum, $n, $input_str) = @_;

	my @list = split(/, /, $input_str);

	my @distances;
	my @combinations = get_combinations(\@list, $n);
	print Dumper(\@combinations);
	for my $comb (@combinations) {
		my $total = 0;
		for my $distance (@{$comb}) {
			print $distance, "\n";
			$total += $distance;
		}
		push @distances, $total;
	}

	# sort @distances;

    return $distances[0];
}

sub combine {
	my ($list, $n) = @_;

	my @combined;
	return \@combined if $n > @$list;
	return map [$_], @$list if $n <= 1;

	for (my $ix = 0; $ix + $n <= @$list; ++$ix) {
		my $el = $list->[$ix];
		my @rem = @$list[$ix+1..$#$list];
		push @combined, [$el, @$_] for combine(\@rem, $n - 1);
	}

	\@combined;
}

sub get_combinations {
	my ($list, $n) = @_;

	my $combined = combine($list, $n);
	my @nested = @{$combined->[0]};
	print "nested: ", Dumper(\@nested);

	print "---------------------------\n";

	my $start_pair = 0;
	my @output;
	my @prefix;
	for (@nested) {
		my @entry;
		print "nested.entry: ", Dumper($_);
		if (ref $_ eq 'ARRAY') {
			push @output, [@prefix, @{$_}];
		} else {
			push @prefix, $_;
		}
	}

	print "output: ", Dumper(\@output);

	$combined;
}
