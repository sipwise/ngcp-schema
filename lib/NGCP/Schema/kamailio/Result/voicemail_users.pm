package NGCP::Schema::kamailio::Result::voicemail_users;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voicemail_users");


__PACKAGE__->add_columns(
  "uniqueid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "customer_id",
  { data_type => "char", default_value => "", is_nullable => 0, size => 36 },
  "context",
  {
    data_type => "varchar",
    default_value => "default",
    is_nullable => 0,
    size => 63,
  },
  "mailbox",
  { data_type => "varchar", is_nullable => 0, size => 31 },
  "password",
  { data_type => "varchar", default_value => 0, is_nullable => 0, size => 31 },
  "fullname",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "pager",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "tz",
  {
    data_type => "varchar",
    default_value => "central",
    is_nullable => 0,
    size => 10,
  },
  "attach",
  { data_type => "varchar", default_value => "yes", is_nullable => 0, size => 4 },
  "saycid",
  { data_type => "varchar", default_value => "yes", is_nullable => 0, size => 4 },
  "dialout",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "callback",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 10 },
  "review",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "operator",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "envelope",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "sayduration",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "saydurationm",
  { data_type => "tinyint", default_value => 1, is_nullable => 0 },
  "sendvoicemail",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "delete",
  {
    accessor => "column_delete",
    data_type => "varchar",
    default_value => "no",
    is_nullable => 0,
    size => 4,
  },
  "nextaftercmd",
  { data_type => "varchar", default_value => "yes", is_nullable => 0, size => 4 },
  "forcename",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "forcegreetings",
  { data_type => "varchar", default_value => "no", is_nullable => 0, size => 4 },
  "hidefromdir",
  { data_type => "varchar", default_value => "yes", is_nullable => 0, size => 4 },
  "stamp",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("uniqueid");


__PACKAGE__->has_many(
  "voicemail_spools",
  "NGCP::Schema::kamailio::Result::voicemail_spool",
  { "foreign.mailboxuser" => "self.customer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
=encoding UTF-8

=head1 NAME

NGCP::Schema::kamailio::Result::voicemail_users

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voicemail_users>

=head1 ACCESSORS

=head2 uniqueid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 customer_id

  data_type: 'char'
  default_value: (empty string)
  is_nullable: 0
  size: 36

=head2 context

  data_type: 'varchar'
  default_value: 'default'
  is_nullable: 0
  size: 63

=head2 mailbox

  data_type: 'varchar'
  is_nullable: 0
  size: 31

=head2 password

  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 31

=head2 fullname

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 pager

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 tz

  data_type: 'varchar'
  default_value: 'central'
  is_nullable: 0
  size: 10

=head2 attach

  data_type: 'varchar'
  default_value: 'yes'
  is_nullable: 0
  size: 4

=head2 saycid

  data_type: 'varchar'
  default_value: 'yes'
  is_nullable: 0
  size: 4

=head2 dialout

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 callback

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 10

=head2 review

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 operator

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 envelope

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 sayduration

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 saydurationm

  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 sendvoicemail

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 delete

  accessor: 'column_delete'
  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 nextaftercmd

  data_type: 'varchar'
  default_value: 'yes'
  is_nullable: 0
  size: 4

=head2 forcename

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 forcegreetings

  data_type: 'varchar'
  default_value: 'no'
  is_nullable: 0
  size: 4

=head2 hidefromdir

  data_type: 'varchar'
  default_value: 'yes'
  is_nullable: 0
  size: 4

=head2 stamp

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</uniqueid>

=back

=head1 RELATIONS

=head2 voicemail_spools

Type: has_many

Related object: L<NGCP::Schema::kamailio::Result::voicemail_spool>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mUIbxiu60zmQx2ZNw3rQvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
