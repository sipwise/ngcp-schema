package NGCP::Schema::Result::cdr_tag_data;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("accounting.cdr_tag_data");


__PACKAGE__->add_columns(
  "cdr_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "provider_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "direction_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "tag_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "val",
  { data_type => "text", is_nullable => 0 },
  "cdr_start_time",
  { data_type => "decimal", is_nullable => 0, size => [13, 3] },
);


__PACKAGE__->set_primary_key(
  "cdr_id",
  "provider_id",
  "direction_id",
  "tag_id",
  "cdr_start_time",
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::cdr_tag_data

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<cdr_tag_data>

=head1 ACCESSORS

=head2 cdr_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 provider_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 direction_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 val

  data_type: 'text'
  is_nullable: 0

=head2 cdr_start_time

  data_type: 'decimal'
  is_nullable: 0
  size: [13,3]

=head1 PRIMARY KEY

=over 4

=item * L</cdr_id>

=item * L</provider_id>

=item * L</direction_id>

=item * L</tag_id>

=item * L</cdr_start_time>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:puYbbtL0/IVGy2ndIun0Wg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
