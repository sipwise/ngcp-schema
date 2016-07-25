package NGCP::Schema::Result::autoprov_sync_parameters;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

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
    extra => { list => ["http","redirect_panasonic","redirect_yealink","redirect_polycom","redirect_snom"] },
    is_nullable => 0,
  },   
  "parameter_name",
  {
    data_type => "enum",
    extra => { list => ["sync_uri","sync_method","sync_params","security_handler"] },
    is_nullable => 1,
  },
  "parameter_constraint",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

__PACKAGE__->has_many(
  "autoprov_sync",
  "NGCP::Schema::Result::autoprov_sync",
  { "foreign.parameter_id" => "self.id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  }
);


__PACKAGE__->set_primary_key("id");

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

NGCP::Schema::provisioning::Result::autoprov_sync_parameters

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<autoprov_sync_cisco>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 device_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back
