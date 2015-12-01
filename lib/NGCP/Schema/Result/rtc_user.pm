package NGCP::Schema::Result::rtc_user;

use warnings;
use strict;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("Helper::Row::ToJSON", "EncodedColumn");

__PACKAGE__->table("provisioning.rtc_user");

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "reseller_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "rtc_user_id",
  {
    data_type => "varchar",
    is_nullable => 0,
    size => 20,
  },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint("reseller_idx", ["reseller_id"]);
__PACKAGE__->add_unique_constraint("rtc_user_idx", ["rtc_user_id"]);

__PACKAGE__->belongs_to(
  "reseller",
  "NGCP::Schema::Result::resellers",
  { id => "reseller_id" },
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
