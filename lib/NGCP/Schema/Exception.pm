package NGCP::Schema::Exception;
use Sipwise::Base;
use namespace::sweep;

our $VERSION = '2.002';

extends 'Throwable::Error';
has('description', is => 'ro', isa => 'Str', required => 1);
has('context', is => 'ro', isa => 'HashRef', documentation => 'extra data to pass along');

$CLASS->meta->make_immutable(inline_constructor => 0);

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Exception - exceptions that work like ossbss mydie

=head1 VERSION

This document describes NGCP::Schema::Exception version 2.002

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

restricted
