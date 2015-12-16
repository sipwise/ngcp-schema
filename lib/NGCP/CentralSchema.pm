package NGCP::CentralSchema;
use Moose;
extends 'NGCP::Schema';

our $VERSION = '2.007';

sub connection {
    my ($self) = @_;
    $self->SUPER::connection($self->config->as_hash->{ngcp_central_connect_info});
}

no Moose;
1;
