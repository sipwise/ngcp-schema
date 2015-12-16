package NGCP::InterceptSchema;
use Moose;
extends 'NGCP::Schema';

our $VERSION = '2.007';

sub connection {
    my ($self) = @_;
    $self->SUPER::connection($self->config->as_hash->{ngcp_intercept_connect_info});
}

no Moose;
1;
