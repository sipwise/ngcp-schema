package NGCP::Schema::InflateColumn::DateTime::EpochMicro;

use Sipwise::Base '-skip'=>['TryCatch'];
use DateTime qw();

use parent 'DBIx::Class';

our $VERSION = '2.007';

__PACKAGE__->load_components(qw(InflateColumn::DateTime));

# back compat
sub add_columns {
    my ($class, @cols) = @_;
    my @columns;
    while (my $col = shift @cols) {
        my $info = ref $cols[0] ? shift @cols : {};
        if( my $type = delete $info->{ epoch_micro } ) {
            $info->{ inflate_datetime } = 'epoch_micro';
            if( $type =~ m{^[cm]time$} ) {
                __PACKAGE__->load_components( 'TimeStamp' );
                $info->{ set_on_create } = 1;
                $info->{ set_on_update } = 1 if $type eq 'mtime';
            }
        }
        push @columns, $col => $info;
    }
    $class->next::method(@columns);
}

sub _inflate_to_datetime {
    my ($self, $value, $info, @rest) = @_;
    return $self->next::method($value, $info, @rest)
      unless $info->{data_type} eq "decimal"
          || (exists $info->{inflate_datetime}
          && $info->{inflate_datetime} eq 'epoch_micro');
    my $tz = DateTime::TimeZone->new( name => 'local' );
    return DateTime->from_epoch(epoch => $value, time_zone => $tz);
}

sub _deflate_from_datetime {
    my ($self, $value, $info, @rest) = @_;
    return $self->next::method($value, $info, @rest)
      unless $info->{data_type} eq "decimal"
          || (exists $info->{inflate_datetime}
          && $info->{inflate_datetime} eq 'epoch_micro');
    return $value->hires_epoch;
}

1;
