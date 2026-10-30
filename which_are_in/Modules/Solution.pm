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
    
    my @output_arr = ();
    
    my @sub_arr = @{$sub_ref};
    if (scalar @sub_arr == 0) {
        return \@output_arr;
    }
    
    # say Dumper \@sub_arr;
    
    my @super_arr = @{$super_ref};
	# say Dumper \@super_arr;
    
	my %match_hash;
    foreach my $sub_el (@sub_arr) {
		# Avoid running grep if already matched.
		next if exists $match_hash{$sub_el};

		my @matches = grep { /$sub_el/ } @super_arr;
		if (scalar @matches > 0) {
			$match_hash{$sub_el} = 1;
		}
    }

    my @sorted_output = sort keys %match_hash;
    
    return \@sorted_output;
}
