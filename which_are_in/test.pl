use strict;
use warnings;
use Test::More;

use lib './Modules';
use Solution qw(in_array);

sub testing {
    my ($arr1, $arr2, $exp) = @_;
    my $ans = in_array($arr1, $arr2);
    my $sexp = join ",",  @$exp;
    is_deeply($ans, $exp, "Expect: $sexp");
}

subtest "basics" => sub {
    testing(['live', 'arp', 'strong', 'der', 'ong', 'arp', 'arp', 'live'],
            ['lively', 'alive', 'harp', 'sharp', 'armstrong'], ['arp', 'live', 'ong', 'strong']);
=for
    testing(['arp', 'mice', 'bull'], ['lively', 'alive', 'harp', 'sharp', 'armstrong'], ['arp']);
    testing(['cod', 'code', 'wars', 'ewar'], ['lively', 'alive', 'harp', 'sharp', 'armstrong', 'codewars'], ['cod', 'code', 'ewar', 'wars']);
    testing(['cod', 'code', 'wars', 'ewar', 'ar'], ['lively', 'alive', 'harp', 'sharp', 'armstrong', 'codewars'], ['ar', 'cod', 'code', 'ewar', 'wars']);
    testing(['cod', 'code', 'wars', 'ewar', 'ar'], [], []);
=cut
};

done_testing();
