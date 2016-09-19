package NGCP::Schema::Result::acc_cdi;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("accounting.acc_cdi");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "callid",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "mark",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("acc_cdi_callid_idx", ["callid"]);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::acc_cdi

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<acc_cdi>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 callid

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 mark

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<acc_cdi_callid_idx>

=over 4

=item * L</callid>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hgzpZR+G+5UmAPmtOPjHLQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
