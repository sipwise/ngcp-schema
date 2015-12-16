package NGCP::RoSchema;
use Moose;
extends 'NGCP::Schema';

our $VERSION = '2.007';

sub connection {
    my ($self) = @_;
    $self->SUPER::connection($self->config->as_hash->{ngcp_ro_connect_info});
}

no Moose;
1;
