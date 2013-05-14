package NGCP::Schema::provisioning::Result::voip_aig_sequence;
use Sipwise::Base;
use MooseX::NonMoose;
our $VERSION = '1.001';

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE



extends 'DBIx::Class::Core';


__PACKAGE__->load_components("InflateColumn::DateTime");


__PACKAGE__->table("voip_aig_sequence");


__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
);


__PACKAGE__->set_primary_key("id");
=encoding UTF-8

=head1 NAME

NGCP::Schema::provisioning::Result::voip_aig_sequence

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=head1 TABLE: C<voip_aig_sequence>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-14 16:26:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:acEzhvX+ncTfO2zCWaV+1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
