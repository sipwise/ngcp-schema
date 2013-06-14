package NGCP::Schema::carrier;
use Sipwise::Base;
our $VERSION = '1.002';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-04-09 12:33:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2tiLLQMoqYYiicae6bptbA

use MooseX::ClassAttribute qw(class_has);

class_has('config', is => 'rw', isa => 'NGCP::Schema::Config', lazy => 1, default => sub {
    return NGCP::Schema::Config->instance;
});

method connection {
    $self->SUPER::connection($self->config->as_hash->{carrierdb});
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
