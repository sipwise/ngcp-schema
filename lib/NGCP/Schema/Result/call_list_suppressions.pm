package NGCP::Schema::Result::call_list_suppressions;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.call_list_suppressions");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "domain_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "pattern",
  { data_type => "varchar",
    default_value => ".",
    is_nullable => 0,
    size => 255,
  },
  "label",
  { data_type => "varchar",
    default_value => "obfuscated",
    is_nullable => 0,
    size => 255,
  },
  "mode",
  {
    data_type => "enum",
    default_value => "disabled",
    extra => { list => ['disabled','filter_outgoing','filter_incoming','obfuscate_outgoing','obfuscate_incoming'] },
    is_nullable => 0,
  },

);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("cls_domain_mode_pattern_idx", ["domain_id", "mode", "pattern"]);

__PACKAGE__->belongs_to(
  "domain",
  "NGCP::Schema::Result::domains",
  { id => "domain_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;


