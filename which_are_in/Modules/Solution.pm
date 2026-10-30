package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(in_array);
use Data::Dumper qw(Dumper);

# parameters: array_ref, array_ref; return array_ref
sub in_array {
    my ($sub_ref, $super_ref) = @_;
    
	my %match_hash;
    foreach my $sub_el (@{$sub_ref}) {
		# Avoid running grep if already matched.
		next if exists $match_hash{$sub_el};

		# If grep returns some results, set as found in the hash.
		if (grep { /\Q$sub_el/ } @{$super_ref}) {
			$match_hash{$sub_el} = 1;
		}
    }

    [ sort keys %match_hash ];
}
