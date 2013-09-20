package NGCP::Schema::Result::voicemail_spool;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components(
    "InflateColumn::DateTime", 
    "Helper::Row::ToJSON", 
    "+NGCP::Schema::InflateColumn::DateTime::EpochString",
);


__PACKAGE__->table("kamailio.voicemail_spool");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "msgnum",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "dir",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 127 },
  "context",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 63 },
  "macrocontext",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 63 },
  "callerid",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 255 },
  "origtime",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 16 },
  "duration",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 16 },
  "mailboxuser",
  {
    data_type => "varchar",
    default_value => "",
    is_foreign_key => 1,
    is_nullable => 1,
    size => 255,
  },
  "mailboxcontext",
  { data_type => "varchar", default_value => "", is_nullable => 1, size => 63 },
  "recording",
  { data_type => "longblob", is_nullable => 1 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->belongs_to(
  "mailboxuser",
  "NGCP::Schema::Result::voicemail_users",
  { customer_id => "mailboxuser" },
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
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voicemail_spool

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<kamailio.voicemail_spool>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 msgnum

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 dir

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 127

=head2 context

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 63

=head2 macrocontext

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 63

=head2 callerid

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 255

=head2 origtime

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 16

=head2 duration

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 16

=head2 mailboxuser

  data_type: 'varchar'
  default_value: (empty string)
  is_foreign_key: 1
  is_nullable: 1
  size: 255

=head2 mailboxcontext

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 1
  size: 63

=head2 recording

  data_type: 'longblob'
  is_nullable: 1

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 mailboxuser

Type: belongs_to

Related object: L<NGCP::Schema::Result::voicemail_users>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:51:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pVE7vFt85S24avmUm7FIMg

for my $col (qw/origtime/) {
    if(__PACKAGE__->has_column($col)) {
        __PACKAGE__->remove_column($col);
        __PACKAGE__->add_column($col =>
            { data_type => "varchar", is_nullable => 0, inflate_datetime => 'epoch_string' }
        );
    }
}

__PACKAGE__->meta->make_immutable;
1;
