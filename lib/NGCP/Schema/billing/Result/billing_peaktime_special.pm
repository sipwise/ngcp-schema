package NGCP::Schema::billing::Result::billing_peaktime_special;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("billing_peaktime_special");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "billing_profile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "start",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "end",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "billing_profile",
  "NGCP::Schema::billing::Result::billing_profiles",
  { id => "billing_profile_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::billing::Result::billing_peaktime_special

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<billing_peaktime_special>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 billing_profile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 start

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 end

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 billing_profile

Type: belongs_to

Related object: L<NGCP::Schema::billing::Result::billing_profiles>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9O4W620S1jmoj2B22u2Ddg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
