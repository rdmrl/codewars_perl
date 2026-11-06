package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(get_pos);
use Data::Dumper qw(Dumper);

my %replacement_regexes = (
    "R" => "(G|A)",
    "Y" => "(C|T)",
    "M" => "(A|C)",
	"K" => "(G|T)",
	"S" => "(G|C)",
	"W" => "(A|T)",
	"B" => "(C|G|T)",
	"D" => "(A|G|T)",
	"H" => "(A|C|T)",
	"V" => "(A|C|G)",
	"N" => "(A|C|G|T)"
);

#input: base, string, query; output: string with positions
sub get_pos {
	my ($base, $srch_string, $query) = @_;

	my @base_lines = split(/\n/, $base);

	# Combine the lines to get the correct index positions.
	$srch_string =~ s/\n//g;
	my $search_area = lc $srch_string;

	my $substring_label;

	# Find the line with the matching query.
	my @matching_lines = grep(/^$query[\s].*/, @base_lines);
	if (scalar @matching_lines > 0) {
		# Take the first match.
		my $matching_line = pop @matching_lines;
		if ($matching_line =~ /^.*\s(\w+)\s*$/) {
			# Extract the label from the end of the string.
			$substring_label = $1;
		}
	}

	my @found;
	if ($substring_label) {
		# Find the labels with the regex containing the
		# substituted characters.
		my $updated_label = update_label($substring_label);

		while ($search_area =~ /$updated_label/g) {
			push @found, $-[0] + 1;
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

	my @updated_letters;
	for my $old_letter (@letters) {
		if ($old_letter =~ /(G|A|T|C)/) {
			push @updated_letters, $old_letter;
		} else {
			my $new_letter = $replacement_regexes{$old_letter};
			push @updated_letters, $new_letter;
		}
	}

	lc join('', @updated_letters);
}
