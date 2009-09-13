package Text::Pipe::RandomCase;

use strict;
use warnings;
use parent 'Text::Pipe::Base';

our $VERSION = '0.01';

__PACKAGE__->mk_scalar_accessors(qw(probability));

sub filter_single {
    my ( $self, $input ) = @_;
    my $prob = $self->probability || 4;
    return join '', map { int rand $prob ? $_ : uc }
      split //xms, $input;
}

1;

__END__

=head1 NAME

Text::Pipe::RandomCase - Text::Pipe filter to randomize character case

=head1 SYNOPSIS

   use Text::Pipe qw(PIPE);
   print PIPE('RandomCase')->filter('foobar');
   print PIPE('RandomCase', probability => 2 )->filter('foobar');

=head1 DESCRIPTION

This module provides a pipe segment for L<Text::Pipe> to randomly
uppercase the characters of a string. It takes one optional argument
named I<probatility>, which determines the frequency of upper case
characters. Any 1/N'th character will be uppercased on average.

If you do not pass any arguments, I<filter()> will return strings
with a probability of 1/4 for any character to be uppercased.

=head1 DEPENDENCIES

L<Text::Pipe>

=head1 VERSION

0.01

=head1 AUTHOR

Mario Domgoergen <mdom@cpan.org>

=head1 BUGS

Please report any bugs or feature requests to C<bug-text-pipe-randomcase
at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Pipe-RandomCase>.  I
will be notified, and then you'll automatically be notified of
progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Pipe::RandomCase

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Pipe-RandomCase>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text-Pipe-RandomCase>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Text-Pipe-RandomCase>

=item * Search CPAN

L<http://search.cpan.org/dist/Text-Pipe-RandomCase>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2008-2009 Mario Domgoergen.

This program is free software; you can redistribute it and/or modify
it under the terms the GNU General Public License as published by
the Free Software Foundation; either version 1, or (at your option)
any later version.
