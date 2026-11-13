package Solution;

use 5.30.0;
use strict;
use warnings;
use Exporter qw(import);
our @EXPORT_OK = qw(nba_cup);
use Data::Dumper qw(Dumper);

sub nba_cup {  
	my ($score_string, $team) = @_;

	if (length $team == 0 || length $score_string == 0) {
		return '';
	}

	my %team_scores = (
		'won' => 0,
		'drawn' => 0,
		'lost' => 0,
		'scored' => 0,
		'conceded' => 0
	);

	# remove the new lines to form a single string.
	$score_string =~ s/\n//g;

	my $found_team = 0;
	my @score_lines = split(/,/, $score_string);
	for my $line (@score_lines) {
		my ($team1, $score1, $team2, $score2) = $line =~ m/^(.*)\s(\d+\.*\d*)\s(.*)\s(\d+\.*\d*)$/g;

		if ($team1 eq $team || $team2 eq $team) {
			if (is_float($score1) || is_float($score2)) {
				return "Error(float number):$line";
			}

			$found_team = 1;

			if ($score1 == $score2) {
				$team_scores{'drawn'}++;
			}

			my $key1 = 'lost';
			if ($score1 > $score2) {
				# Team1 has won.
				$key1 = 'won' if ($team1 eq $team);
			} else {
				# Team2 has won.
				$key1 = 'won' if ($team2 eq $team);
			}
			$team_scores{$key1}++;

			if ($team1 eq $team) {
				$team_scores{'scored'} += $score1;
				$team_scores{'conceded'} += $score2;
			} elsif ($team2 eq $team) {
				$team_scores{'scored'} += $score2;
				$team_scores{'conceded'} += $score1;
			}
		}
	}

	if ($found_team) {
		my $points = 3 * $team_scores{'won'} + 1 * $team_scores{'drawn'};
		return "$team:W=$team_scores{'won'};D=$team_scores{'drawn'};"
			. "L=$team_scores{'lost'};Scored=$team_scores{'scored'};"
			. "Conceded=$team_scores{'conceded'};Points=$points";
	} else {
		return "$team:This team didn't play!";
	}
}

sub is_float {
	my ($num) = @_;

	return ($num =~ /\d+\.\d+/);
}
