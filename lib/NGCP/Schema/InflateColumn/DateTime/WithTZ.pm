package NGCP::Schema::InflateColumn::DateTime::WithTZ;

use strict;
use warnings;
use base qw/DBIx::Class/;
use DBIx::Class::Carp;
use Try::Tiny;
use namespace::clean;

__PACKAGE__->load_components(qw/InflateColumn/);

use DateTime::TimeZone qw();
our $LocalTZ = DateTime::TimeZone->new( name => 'local' );
#our $NGCP::Schema::CURRENT_USER_TZ;
# cache local tz to save calculation time

# Chains with the L<DBIx::Class::Row/register_column> method, and sets
# up datetime columns appropriately.  This would not normally be
# directly called by end users.
sub register_column {
  my ($self, $column, $info, @rest) = @_;

  use DDP use_prototypes=>0; #p $column; p "withtz::rc called";

  $self->next::method($column, $info, @rest);

  #p "withtz::rc step 2";

  my $requested_type;
  for (qw/datetime timestamp date/) {
    my $key = "inflate_${_}";
    if (exists $info->{$key}) {

      # this bailout is intentional
      return unless $info->{$key};

      $requested_type = $_;
      last;
    }
  }

  return if (!$requested_type && !$info->{data_type});

  my $data_type = lc( $info->{data_type} || '' );

  # _ic_dt_method will follow whatever the registration requests
  # thus = instead of ||=
  if ($data_type eq 'timestamp with time zone' || $data_type eq 'timestamptz') {
    $info->{_ic_dt_method} = 'timestamp_with_timezone';
  }
  elsif ($data_type eq 'timestamp without time zone') {
    $info->{_ic_dt_method} = 'timestamp_without_timezone';
  }
  elsif ($data_type eq 'smalldatetime') {
    $info->{_ic_dt_method} = 'smalldatetime';
  }
  elsif ($data_type =~ /^ (?: date | datetime | timestamp ) $/x) {
    $info->{_ic_dt_method} = $data_type;
  }
  elsif ($requested_type) {
    $info->{_ic_dt_method} = $requested_type;
  }
  else {
    return;
  }

  # shallow copy to avoid unfounded(?) Devel::Cycle complaints
  my $infcopy = {%$info};

  $self->inflate_column(
    $column =>
      {
        inflate => sub {
          my ($value, $obj) = @_;

          # propagate for error reporting
          $infcopy->{__dbic_colname} = $column;

          my $dt = $obj->_inflate_to_datetime( $value, $infcopy );

          return (defined $dt)
            ? $obj->_post_inflate_datetime( $dt, $infcopy )
            : undef
          ;
        },
        deflate => sub {
          my ($value, $obj) = @_;

          $value = $obj->_pre_deflate_datetime( $value, $infcopy );
          $obj->_deflate_from_datetime( $value, $infcopy );
        },
      }
  );
}

sub _flate_or_fallback
{
  my( $self, $value, $info, $method_fmt ) = @_;

  my $parser = $self->_datetime_parser;
  my $preferred_method = sprintf($method_fmt, $info->{ _ic_dt_method });
  my $method = $parser->can($preferred_method) || sprintf($method_fmt, 'datetime');

  return try {
    $parser->$method($value);
  }
  catch {
    $self->throw_exception ("Error while inflating '$value' for $info->{__dbic_colname} on ${self}: $_")
      unless $info->{datetime_undef_if_invalid};
    undef;  # rv
  };
}

sub _inflate_to_datetime {
  my( $self, $value, $info ) = @_;
  return $self->_flate_or_fallback( $value, $info, 'parse_%s' );
}

sub _deflate_from_datetime {
  my( $self, $value, $info ) = @_;
  return $self->_flate_or_fallback( $value, $info, 'format_%s' );
}

sub _datetime_parser {
  shift->result_source->storage->datetime_parser (@_);
}

sub _post_inflate_datetime {
  my( $self, $dt, $info ) = @_;

  $dt->set_time_zone($LocalTZ);  # db connection is set to local
   $dt->set_time_zone('UTC');  # convert to UTC
  if ($NGCP::Schema::CURRENT_USER_TZ) {
    $dt->set_time_zone($NGCP::Schema::CURRENT_USER_TZ);  # convert to CURRENT_USER_TZ
  }

  $dt->set_locale($info->{locale}) if defined $info->{locale};

  return $dt;
}

sub _pre_deflate_datetime {
  my( $self, $dt, $info ) = @_;

  if (defined $info->{timezone}) {
    carp "You're using a floating timezone, please see the documentation of"
      . " DBIx::Class::InflateColumn::DateTime for an explanation"
      if ref( $dt->time_zone ) eq 'DateTime::TimeZone::Floating'
          and not $info->{floating_tz_ok}
          and not $ENV{DBIC_FLOATING_TZ_OK};

    $dt->set_time_zone($info->{timezone});
  }

  $dt->set_locale($info->{locale}) if defined $info->{locale};

  return $dt;
}

1;
