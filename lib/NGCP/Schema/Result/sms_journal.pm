package NGCP::Schema::Result::sms_journal;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("provisioning.sms_journal");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "subscriber_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  # "time",
  # { data_type => "decimal",
  #   is_nullable => 0,
  #   size => [13, 3],
  #   inflate_datetime => 'epoch_milli'
  #  },
  "time",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "direction",
  {
    data_type => "enum",
    extra => { list => ["in", "out", "forward" ] },
    is_nullable => 0,
  },
  "caller",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "text",
  { data_type => "text", is_nullable => 0 },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "pcc_status",
  {
    data_type => "enum",
    extra => { list => ["none", "pending", "complete" ] },
    is_nullable => 0,
  },
  "coding",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "pcc_token",
  { data_type => "varchar", is_nullable => 0, size => 64 },
  "cli",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "smsc_peer",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
);
__PACKAGE__->belongs_to(
  "provisioning_voip_subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { 'foreign.id' => 'self.subscriber_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->set_primary_key("id");

sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}

1;
