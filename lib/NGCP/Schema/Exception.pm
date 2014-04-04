package NGCP::Schema::Exception;
use Sipwise::Base;
use namespace::sweep;

our $VERSION = '2.007';

extends 'Throwable::Error';
has('description', is => 'ro', isa => 'Str', required => 1);
has('context', is => 'ro', isa => 'HashRef', documentation => 'extra data to pass along');

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Exception - exceptions that work like ossbss mydie

=head1 VERSION

This document describes NGCP::Schema::Exception version 2.007

=head1 SYNOPSIS

    use aliased 'NGCP::Schema::Exception';
    Exception->throw({
        description => 'Client.Auth.Failed',
        message => 'authentication failed',
    });

=head1 DESCRIPTION

This is a stop-gap measure to port ossbss code.

=head1 INTERFACE

=head2 Composition

    NGCP::Schema::Exception
        ISA Throwable::Error

All methods and attributes not mentioned here are inherited from L<Throwable::Error>.

=head2 Attributes

=head3 C<description>

Type C<Str>, B<required> attribute, designates the ossbss error type.

=head3 C<context>

Type C<HashRef>, extra data to pass along to the error handler.

=head2 Exports

None.

=head1 DIAGNOSTICS

None.

=head1 CONFIGURATION AND ENVIRONMENT

NGCP::Schema::Exception requires no configuration files or environment variables.

=head1 DEPENDENCIES

See meta file in the source distribution.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

L<https://bugtracker.sipwise.com>

No known limitations.

=head1 TO DO

This becomes obsolete with a hierarchy of exception classes.

=head1 SEE ALSO

L<Sipwise::Provisioning/mydie>

=head1 AUTHOR

Lars Dieckow C<< <ldieckow@sipwise.com> >>

=head1 LICENCE

This software is Copyright © 2013 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public
License along with this package; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor,
Boston, MA  02110-1301 USA

On Debian systems, the full text of the GNU General Public
License version 3 can be found in the file
F</usr/share/common-licenses/GPL-3>.
