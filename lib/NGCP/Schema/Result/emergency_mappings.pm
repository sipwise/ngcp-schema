package NGCP::Schema::Result::emergency_mappings;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.emergency_mappings");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "code",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "prefix",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "suffix",
  { data_type => "varchar", is_nullable => 1, size => 31 },
  "emergency_container_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("ec_code_idx", ["emergency_container_id", "code"]);

__PACKAGE__->belongs_to(
  "emergency_container",
  "NGCP::Schema::Result::emergency_containers",
  { id => "emergency_container_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
__END__
