package NGCP::Schema::Result::lnp_numbers_actual;
use Scalar::Util qw(blessed);
use base qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "Helper::Row::ToJSON",
  #"+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("lnp_numbers_actual");


__PACKAGE__->add_columns(
  "actual_ln_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "number",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 31
  },
);


__PACKAGE__->has_many(
  "lnp_numbers",
  "NGCP::Schema::Result::lnp_numbers",
  { "foreign.number" => "self.number" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->set_primary_key("actual_ln_id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

#select
#  p.id,
#  p.prefix,
#  n.number,
#  n.routing_number
#from
#  billing.lnp_numbers n
#  left join billing.lnp_providers p on n.lnp_provider_id = p.id
#where
#  n.number in ("1", "12", "123", "1234")
#  and (n.start is null or n.start <= now())
#  and (n.end is null or n.end >= now())
#order by length(n.number) desc limit 1

__PACKAGE__->result_source_instance->view_definition(<<SQL);
SELECT ln.number,MAX(ln.id) AS actual_ln_id FROM billing.lnp_numbers ln
INNER JOIN (
    SELECT lnn.number, MAX(lnn.start) max_start
    FROM billing.lnp_numbers lnn
    WHERE ( lnn.`end` >= ? OR lnn.`end` IS NULL )
        AND ( lnn.`start` <= ? OR lnn.`start` IS NULL )
        AND ( ? is null OR lnn.`number` LIKE ? )
    GROUP BY lnn.number
) lnn ON ln.number=lnn.number
    AND (ln.start=lnn.max_start
        OR (lnn.max_start IS NULL AND ln.start IS NULL))
GROUP BY ln.number
SQL

1;
