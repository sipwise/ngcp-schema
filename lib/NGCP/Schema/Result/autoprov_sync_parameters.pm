package NGCP::Schema::Result::autoprov_sync_parameters;
use Sipwise::Base;
use Scalar::Util qw(blessed);
our $VERSION = '2.007';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



use base 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");


__PACKAGE__->table("provisioning.autoprov_sync_parameters");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "bootstrap_method",
  {
    data_type => "enum",
    default_value => "http",
    extra => {
      list => [
        "http",
        "redirect_panasonic",
        "redirect_yealink",
        "redirect_polycom",
        "redirect_snom",
      ],
    },
    is_nullable => 0,
  },
  "parameter_name",
  {
    data_type => "enum",
    extra => {
      list => [
        "sync_uri",
        "sync_method",
        "sync_params",
        "security_handler",
        "profile",
      ],
    },
    is_nullable => 0,
  },
  "parameter_constraint",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


__PACKAGE__->set_primary_key("id");


__PACKAGE__->add_unique_constraint("sync_parameter", ["bootstrap_method", "parameter_name"]);


__PACKAGE__->has_many(
  "autoprov_syncs",
  "NGCP::Schema::Result::autoprov_sync",
  { "foreign.parameter_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);
sub TO_JSON {
    my ($self) = @_;
    return {
        map { blessed($_) && $_->isa('DateTime') ? $_->datetime : $_ } %{ $self->next::method }
    };
}
=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::autoprov_sync_parameters

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<autoprov_sync_parameters>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 bootstrap_method

  data_type: 'enum'
  default_value: 'http'
  extra: {list => ["http","redirect_panasonic","redirect_yealink","redirect_polycom","redirect_snom"]}
  is_nullable: 0

=head2 parameter_name

  data_type: 'enum'
  extra: {list => ["sync_uri","sync_method","sync_params","security_handler","profile"]}
  is_nullable: 0

=head2 parameter_constraint

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<sync_parameter>

=over 4

=item * L</bootstrap_method>

=item * L</parameter_name>

=back

=head1 RELATIONS

=head2 autoprov_syncs

Type: has_many

Related object: L<NGCP::Schema::Result::autoprov_sync>

=cut


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-20 17:36:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:x6D1jHV2s6/06xdvHPt6ZA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
