package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_pos);
use Data::Dumper qw(Dumper);

my %replacement_regexes = (
    "R" => /(G|A)/,
    "Y" => /(C|T)/,
    "M" => /(A|C)/,
	"K" => /(G|T)/,
	"S" => /(G|C)/,
	"W" => /(A|T)/,
	"B" => /(C|G|T)/,
	"D" => /(A|G|T)/,
	"H" => /(A|C|T)/,
	"V" => /(A|C|G)/,
	"N" => /(A|C|G|T)/
);

#input: base, string, query; output: string with positions
sub get_pos {
	my ($base, $srch_string, $query) = @_;

	my @base_lines = split(/\n/, $base);
	my $search_area = lc $srch_string;

	my $substring_label;

	print "query: $query\n";

	# Find the line with the matching query.
	my @matching_lines = grep(/^$query[\s].*/, @base_lines);
	print Dumper(\@matching_lines);
	if (scalar @matching_lines > 0) {
		# Take the first match.
		my $matching_line = pop @matching_lines;
		if ($matching_line =~ /^.*\s(\w+)\s*$/) {
			# Extract the label from the end of the string.
			$substring_label = $1;
			print "sub.label: $substring_label\n";
		}
	}

	my @found;
	if ($substring_label) {
		# Find the labels with the replaced characters.
		my $updated_labels = update_label($substring_label);
		print Dumper($updated_labels);
		for my $upd_label (@{$updated_labels}) {
			my $ix = 0;
			my $next_ix = 0;
			my $label_length = length($upd_label);
			do {
				$ix = index $search_area, $upd_label, $next_ix;
				if ($ix != -1) {
					push @found, ($ix + 1);
					$next_ix = $ix + $label_length;
				}
			} while($ix > -1);
		}
	} else {
		return "This query name does not exist in given Base";
	}

	if (scalar @found == 0) {
		return "$query is not in given string";
	}

	return join(' ', @found);
}


sub update_label {
	my ($label) = @_;

	my @letters = split(//, $label);

	# These four letters should not be replaced.
	my %seen = ('C' => 1, 'A' => 1, 'T' => 1, 'G' => 1);

	# If not in the 'seen' hash, add the letter
	# only once to the replace list.
	my @letters_to_replace = grep !$seen{$_}++, @letters;

	my @updated_labels;
	for my $old_letter (@letters_to_replace) {
		for my $new_letter (@{$replacement_regexes{$old_letter}}) {
			my $new_label = $label =~ s/$old_letter/$new_letter/gr;
			push @updated_labels, lc $new_label;
		}
	}

	\@updated_labels;
}
