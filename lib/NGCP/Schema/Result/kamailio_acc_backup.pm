package NGCP::Schema::Result::kamailio_acc_backup;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.000';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("kamailio.acc_backup");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "method",
  {
    accessor => "column_method",
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 16,
  },
  "from_tag",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "to_tag",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "callid",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "sip_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 3 },
  "sip_reason",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "time",
  {
    accessor => "column_time",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "time_hires",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "src_leg",
  { data_type => "varchar", is_nullable => 1, size => 2048 },
  "dst_leg",
  { data_type => "varchar", is_nullable => 1, size => 2048 },
  "dst_user",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "dst_ouser",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "dst_domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "src_user",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "src_domain",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
);


__PACKAGE__->set_primary_key("id");
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::kamailio_acc_backup

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.acc_backup>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 method

  accessor: 'column_method'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 from_tag

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 to_tag

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 callid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 sip_code

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 3

=head2 sip_reason

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 time

  accessor: 'column_time'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 time_hires

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 src_leg

  data_type: 'varchar'
  is_nullable: 1
  size: 2048

=head2 dst_leg

  data_type: 'varchar'
  is_nullable: 1
  size: 2048

=head2 dst_user

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 dst_ouser

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 dst_domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 src_user

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 src_domain

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ytEmWh6kooVkBo656daUlg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
