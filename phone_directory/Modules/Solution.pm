package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(phone);
use Data::Dumper qw(Dumper);

sub phone {  
	my ($s, $num) = @_;

	my %data;
	my %seen;

	my $name_regex = qr/(.*)/;
	my $phone_regex = qr/\+(\d{1,2}-\d{3}-\d{3}-\d{4})/;

	for (split(/\\n/, $s)) {
		my $line = $_;

		my $name;
		if ($line =~ m/<(?<name>$name_regex)>/g) {
			$name = $+{name};
			# remove the name from the line.
			$line =~ s/<$name>//g;
		}

		my $phone;
		if ($line =~ m/(?<phone>$phone_regex)/g) {
			$phone = $+{phone};
			# remove the phone from the line.
			$phone =~ s/\+//g;
			$line =~ s/$phone_regex//g;
		}

		if ($seen{$phone}) {
			$seen{$phone}++;
		} else {
			$seen{$phone} = 1;
		}

		# use the remaining content as the address.
		my $address = $line;
		$address =~ s/[\@#\$%\\\/;\*\!\?\:\,]//g;
        $address =~ s/, ,/,/g;
        $address =~ s/ +/ /g;
        $address =~ s/_/ /g;
        $address =~ s/^\s+//g;
        $address =~ s/\s+$//g;

		$data{$phone} = {'Phone' => $phone, 'Name' => $name, 'Address' => $address};
	}

	my $return;
	my $has_entry = $seen{$num};
	if ($has_entry) {
		if ($has_entry > 1) {
			$return = "Error => Too many people: $num";
		} else {
			my %match = %{$data{$num}};
			$return = "Phone => $match{'Phone'}, Name => $match{'Name'}, Address => $match{'Address'}";
		}
	} else {
		$return = "Error => Not found: $num";
	}

	$return;
}

