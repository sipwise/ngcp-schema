package NGCP::Schema::accounting;
use Sipwise::Base;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2013-04-09 12:30:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/gINj3OenRQkhpdpfbQq4Q

use MooseX::ClassAttribute qw(class_has);

class_has('config', is => 'rw', isa => 'NGCP::Schema::Config', lazy => 1, default => sub {
    return NGCP::Schema::Config->instance;
});

method connection {
    my %connect_info = %{ $self->config->as_hash->{accountingdb} };
    $self->SUPER::connection(@connect_info{qw(dsn username password)});
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
