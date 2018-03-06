package NGCP::Schema::Result::invoice_templates;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.009';

__PACKAGE__->load_components("+NGCP::Schema::InflateColumn::DateTime::WithTZ", "Helper::Row::ToJSON");


__PACKAGE__->table("billing.invoice_templates");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "type",
  {
    data_type => "enum",
    default_value => "svg",
    extra => { list => ["svg", "html"] },
    is_nullable => 0,
  },
  "data",
  { data_type => "mediumblob", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
