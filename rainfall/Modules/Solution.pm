package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(mean variance);

# parameters: rainfall_data (string), town (string)
sub mean {
    my ($rainfall_data, $town) = @_;

	calc_mean(get_monthly_data($rainfall_data, $town));
}

sub variance {
    my ($rainfall_data, $town) = @_;

	my $array_ref = get_monthly_data($rainfall_data, $town);

	my $mean = calc_mean($array_ref);

	my @temp_data = @{$array_ref};
	my $temp_count = scalar @temp_data;

	my $var_total = 0.0;
	for (@temp_data) {
		my @temp_parts = split(/ /, $_);
		$var_total += ($mean - $temp_parts[1]) ** 2;
	}

	$var_total / $temp_count;
}

sub calc_mean {
	my ($array_ref) = @_;
	my @temp_data = @{$array_ref};

	my $temp_count = scalar @temp_data;

	my $temp_total = 0;
	for (@temp_data) {
		my @temp_parts = split(/ /, $_);
		$temp_total += $temp_parts[1];
	}

	$temp_total / $temp_count;
}

sub get_monthly_data {
    my ($rainfall_data, $town) = @_;

	my @lines = split(/\n/, $rainfall_data);
	my @town_data = grep(/^$town/, @lines);

	my @temp_data;
	if (scalar @town_data > 0) {
		my $colon_ix = index $town_data[0], ":";
		my $monthly_data = substr $town_data[0], $colon_ix + 1;
		@temp_data = split (/,/, $monthly_data);
	}

	\@temp_data;
}
