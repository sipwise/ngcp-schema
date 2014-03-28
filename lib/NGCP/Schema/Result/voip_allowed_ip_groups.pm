package NGCP::Schema::Result::voip_allowed_ip_groups;
use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.010';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.voip_allowed_ip_groups");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ipnet",
  { data_type => "varchar", is_nullable => 0, size => 18 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("groupnet_idx", ["group_id", "ipnet"]);

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

NGCP::Schema::Result::voip_allowed_ip_groups

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.voip_allowed_ip_groups>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ipnet

  data_type: 'varchar'
  is_nullable: 0
  size: 18

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<groupnet_idx>

=over 4

=item * L</group_id>

=item * L</ipnet>

=back
