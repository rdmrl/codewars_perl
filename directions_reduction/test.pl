use strict;
use warnings;
use Test::More;
use lib './Modules';
use Solution qw(dir_reduc);

sub dotest {
    my ($a,  $exp) = @_;
    my $ans = dir_reduc($a);
    is_deeply($ans, $exp, "Expect:@{$exp}");
}

subtest "basics" => sub {
    my $a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"];
    dotest($a, ["WEST"]);
    $a = ["NORTH", "WEST", "SOUTH", "EAST"];
    dotest($a, ["NORTH", "WEST", "SOUTH", "EAST"]);
    $a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "NORTH"];
    dotest($a, ["NORTH"]);
    $a = ["EAST", "EAST", "WEST", "NORTH", "WEST", "EAST", "EAST", "SOUTH", "NORTH", "WEST"];
    dotest($a, ["EAST", "NORTH"]);
    $a = ["NORTH", "EAST", "NORTH", "EAST", "WEST", "WEST", "EAST", "EAST", "WEST", "SOUTH"];
    dotest($a, ["NORTH", "EAST"]);
    $a = [];
    dotest($a, []);
};

done_testing();

