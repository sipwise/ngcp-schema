package NGCP::Schema::Result::voip_fax_data;

use strict;
use warnings;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
);

__PACKAGE__->table("provisioning.voip_fax_data");

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
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "sid",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 255
  },
  "size",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "checksum",
  {
    data_type => "char",
    size => 32,
    is_nullable => 0,
  },
  "data",
  {
    data_type => "mediumblob",
    is_nullable => 0
  },
);

__PACKAGE__->belongs_to(
  "voip_fax_journal",
  "NGCP::Schema::Result::voip_fax_journal",
  { 'foreign.sid' => 'self.sid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "provisioning_voip_subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { 'foreign.id' => 'self.subscriber_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->set_primary_key("id");

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_fax_data

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_fax_journal>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 size

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 checksum

  data_type: 'char'
  is_nullable: 0
  size: 32

=head2 data

  data_type: 'mediumblob'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
