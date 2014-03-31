package NGCP::Schema::Result::invoice_template_resources;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.010';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("invoice_template_resources");


__PACKAGE__->add_columns(
  "invoice_template_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "is_active",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "type",
  { data_type => "enum", extra => { list => ["css"] }, is_nullable => 1 },
  "base64",
  { data_type => "mediumblob", is_nullable => 1 },
);


__PACKAGE__->belongs_to(
  "invoice_template",
  "NGCP::Schema::Result::invoice_template",
  { id => "invoice_template_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
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

NGCP::Schema::Result::invoice_template_resources

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<invoice_template_resources>

=head1 ACCESSORS

=head2 invoice_template_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 is_active

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 type

  data_type: 'enum'
  extra: {list => ["css"]}
  is_nullable: 1

=head2 base64

  data_type: 'mediumblob'
  is_nullable: 1

=head1 RELATIONS

=head2 invoice_template

Type: belongs_to

Related object: L<NGCP::Schema::Result::invoice_template>

=cut
