use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(arrange);

sub testing {
    my ($s, $exp) = @_;
    my $ans = arrange($s);
    is($ans, $exp, "arrange: $s\n");
}

subtest "basics" => sub {
    testing("", ""); # 0
    testing("who hit retaining The That a we taken", "who RETAINING hit THAT a THE we TAKEN"); # 3
=for
    testing("on I came up were so grandmothers", "i CAME on WERE up GRANDMOTHERS so"); # 4
    testing("way the my wall them him", "way THE my WALL him THEM"); # 1
    testing("turn know great-aunts aunt look A to back", "turn GREAT-AUNTS know AUNT a LOOK to BACK"); # 2
    testing("on sacrum a traffic I supposed", "on SACRUM a TRAFFIC i SUPPOSED"); # 0
    testing("back were but the stay was", "back WERE but STAY the WAS"); # 1
    testing("Braslia Braslia Eventually He I If She The Then They Waiting With a able about", 
            "braslia EVENTUALLY he BRASLIA i SHE if THEN the WAITING they WITH a ABOUT able"); # 6
    
=cut
};

done_testing();
