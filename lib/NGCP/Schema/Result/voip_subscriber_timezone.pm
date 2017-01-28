package NGCP::Schema::Result::voip_subscriber_timezone;
use Scalar::Util qw(blessed);
use base qw/DBIx::Class::Core/;

our $VERSION = '2.007';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "Helper::Row::ToJSON",
  "+NGCP::Schema::InflateColumn::DateTime::EpochMicro",
);
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table("voip_subscriber_timezone");


__PACKAGE__->add_columns(
  "contact_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "subscriber_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "uuid",
  { 
    data_type => "char", 
    size => 36,
    is_nullable => 0, 
  },
  "timezone",
  {
    data_type => "varchar",
    size      => 255,
    is_nullable => 1,
  },
);

__PACKAGE__->belongs_to(
  "voip_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { id => "subscriber_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contract",
  "NGCP::Schema::Result::contracts",
  { id => "contract_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "contact",
  "NGCP::Schema::Result::contacts",
  { id => "contact_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition("
SELECT sc.id as contact_id, s.id as subscriber_id, s.uuid,
       COALESCE(sc.timezone, cc.timezone, rc.timezone) as timezone
 FROM billing.voip_subscribers s
LEFT OUTER JOIN contacts sc ON sc.id = s.contact_id
JOIN contracts c ON c.id = s.contract_id
JOIN contacts cc ON cc.id = c.contact_id
JOIN resellers r ON r.id = cc.reseller_id
JOIN contracts i ON i.id = r.contract_id
JOIN contacts rc ON rc.id = i.contact_id;
");

1;

