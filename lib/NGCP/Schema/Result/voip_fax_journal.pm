package NGCP::Schema::Result::voip_fax_journal;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components(
    "InflateColumn::DateTime",
    "Helper::Row::ToJSON",
    "+NGCP::Schema::InflateColumn::DateTime::EpochMilli",
);

__PACKAGE__->table("provisioning.voip_fax_journal");

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
  "time",
  { data_type => "decimal",
    is_nullable => 0,
    size => [13, 3],
    inflate_datetime => 'epoch_milli'
   },
  "direction",
  {
    data_type => "enum",
    extra => { list => ["in", "out", "mtf" ] },
    is_nullable => 0,
  },
  "duration",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "caller",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "pages",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "reason",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "status",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "signal_rate",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "quality",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "filename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "sid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "caller_uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "callee_uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
);
__PACKAGE__->belongs_to(
  "provisioning_voip_subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { 'foreign.id' => 'self.subscriber_id' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "caller_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { 'foreign.uuid' => 'self.caller_uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "callee_subscriber",
  "NGCP::Schema::Result::voip_subscribers",
  { 'foreign.uuid' => 'self.callee_uuid' },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->might_have(
  "voip_fax_data",
  "NGCP::Schema::Result::voip_fax_data",
  { 'foreign.sid' => 'self.sid' },
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
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_fax_journal

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
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 direction

  data_type: 'enum'
  default_value: 'in'
  extra: {list => ["in","out","mtf"]}
  is_nullable: 0

=head2 duration

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 caller

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 callee

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 pages

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 reason

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 status

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 signal_rate

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 quality

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 filename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 sid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 caller_uuid

  data_type: 'char'
  is_nullable: 1
  size: 36

=head2 callee_uuid

  data_type: 'char'
  is_nullable: 1
  size: 36


=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 AUTHOR

Sipwise Development Team C<< <support@sipwise.com> >>

=head1 LICENSE

This software is Copyright © 2017 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this package.  If not, see <https://www.gnu.org/licenses/>.
