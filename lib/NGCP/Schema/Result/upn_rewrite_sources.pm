package NGCP::Schema::Result::upn_rewrite_sources;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.upn_rewrite_sources");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "upn_rewrite_set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "pattern",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "upn_rewrite_set",
  "NGCP::Schema::Result::upn_rewrite_set",
  { id => "upn_rewrite_set_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
