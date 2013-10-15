package NGCP::Schema::Result::voip_reminder;
use Sipwise::Base;
use MooseX::NonMoose;
use Scalar::Util qw(blessed);
our $VERSION = '2.006';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.voip_reminder");


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
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "time",
  { accessor => "column_time", data_type => "time", is_nullable => 0 },
  "recur",
  {
    data_type => "enum",
    default_value => "never",
    extra => { list => ["never", "weekdays", "always"] },
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("subscriber_id", ["subscriber_id"]);


__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::voip_reminder

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_reminder>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 subscriber_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 time

  accessor: 'column_time'
  data_type: 'time'
  is_nullable: 0

=head2 recur

  data_type: 'enum'
  default_value: 'never'
  extra: {list => ["never","weekdays","always"]}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<subscriber_id>

=over 4

=item * L</subscriber_id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-06-27 12:52:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nvhtEWDw8of8Z6J7UmVO2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
