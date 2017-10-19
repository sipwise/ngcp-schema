package NGCP::InterceptSchema;

use warnings;
use strict;

use base 'NGCP::Schema';

our $VERSION = '2.007';

sub connection {
    my ($self) = @_;
    my $full_config = NGCP::Schema::Config::get_config_hash();
    $self->SUPER::connection($full_config->{ngcp_intercept_connect_info});
}

1;
