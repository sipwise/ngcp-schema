package NGCP::Schema::Result::malicious_calls;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("accounting.malicious_calls");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "callee_uuid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "call_id",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "start_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "duration",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
  "caller",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "callee",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "source",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "reported_at",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("mcid_callid_idx", ["call_id"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::malicious_calls

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<malicious_calls>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 callee_uuid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 call_id

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 start_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 duration

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head2 caller

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 callee

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 source

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 reported_at

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<mcid_callid_idx>

=over 4

=item * L</call_id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HMHQShLReuW9KbaV0sY+mg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
