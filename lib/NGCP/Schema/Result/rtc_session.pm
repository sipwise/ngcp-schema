package NGCP::Schema::Result::rtc_session;

use warnings;
use strict;

use Scalar::Util qw(blessed);
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("Helper::Row::ToJSON", "EncodedColumn");

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
