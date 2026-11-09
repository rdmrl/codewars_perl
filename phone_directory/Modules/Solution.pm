package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(phone);
use Data::Dumper qw(Dumper);

sub phone {  
	my ($s, $num) = @_;

	my @lines = split(/\\n/, $s);

	my $name_regex = qr/(.*)/;
	my $phone_regex = qr/\+(\d{1,2}-\d{3}-\d{3}-\d{4})/;
	for (@lines) {
		# print $_, "\n";
		if ($_ =~ m/<(?<name>$name_regex)>/g) {
			print $+{name}, "\n";
		}
		if ($_ =~ m/(?<phone>$phone_regex)/g) {
			print $+{phone}, "\n";
		}
	}
}

