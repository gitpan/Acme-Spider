package Acme::Spider;
$Acme::Spider::VERSION = '0.01';

=head1 NAME

Acme::Spider - frighten some other modules

=head1 SYNOPSIS

  use Acme::Spider;

=head1 DESCRIPTION

Damian Conway is afraid of spiders, and all his code is afraid of this spider.

=head1 TODO

As the spider evolves, it will become better at recognising Damian's modules.

=cut

use strict;
use warnings;
use Carp;

my $re = do {
	my @data = <DATA>;
	chomp @data;
	my $data = join '|', @data;
	qr/^(?:$data)/;
};

sub victim {
	my ($file) = @_;
	return scalar $file =~ $re;
}

sub bite {
	my ($self, $file) = @_;
	# we need to expand this test to include other Damian modules.
	if (victim($file)) {
		carp "$file doesn't like spiders";
		return 0;
	}
	return undef;
}

BEGIN { unshift @INC, \&bite }

=head1 AUTHORS

Marty Pauley E<lt>marty@kasei.comE<gt>
Karen Pauley E<lt>karen@kasei.comE<gt>

=head1 COPYRIGHT

  Copyright (C) 2002 Kasei Limited

  This program is free software; you can redistribute it and/or modify it under
  the terms of either the GNU General Public License; either version 2 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.

=cut

1;

__DATA__
Acme/Bleach
Acme/Don/t
Attribute/Handlers
Attribute/Handlers/Prospective
Attribute/Types
Class/Contract
Class/Delegation
Class/Multimethods
Coy
Filter/Simple
Getopt/Declare
Hook/LexWrap
Inline/Files
Lingua/EN/Inflect
Lingua/Romana/Perligata
NEXT
Parse/RecDescent
Perl6/Currying
Perl6/Placeholders
Perl6/Variables
Quantum/Superpositions
Regexp/Common
Switch
Text/Autoformat
Text/Balanced
Text/Reform
Tie/SecureHash
