package NGCP::Schema::Result::rtc_session;

use warnings;
use strict;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("Helper::Row::ToJSON");

__PACKAGE__->table("provisioning.rtc_session");

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
    is_nullable => 1,
  },
  "rtc_session_id",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 20,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("subscriber_idx", ["subscriber_id"]);
__PACKAGE__->add_unique_constraint("rtc_session_idx", ["rtc_session_id"]);

__PACKAGE__->belongs_to(
  "subscriber",
  "NGCP::Schema::Result::provisioning_voip_subscribers",
  { id => "subscriber_id" },
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

1;

__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::rtc_session

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<provisioning.rtc_session>

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

=head2 rtc_session_id

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 rtc_network_tag

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 UNIQUE CONSTRAINTS

=head2 C<subscriber_idx>

=over 4

=item * L</subscriber_id>

=back

=head2 C<rtc_session_idx>

=over 4

=item * L</rtc_session_id>

=back

=head1 RELATIONS

=head2 subscriber

Type: belongs_to

Related object: L<NGCP::Schema::Result::provisioning_voip_subscribers>
