package NGCP::Schema::InflateColumn::DateTime::EpochMilli;
use Sipwise::Base;
use DateTime qw();

extends 'DBIx::Class';

__PACKAGE__->load_components(qw(InflateColumn::DateTime));

# back compat
sub add_columns {
    my ($class, @cols) = @_;
    my @columns;
    while (my $col = shift @cols) {
        my $info = ref $cols[0] ? shift @cols : {};
        if( my $type = delete $info->{ epoch_milli } ) {
            $info->{ inflate_datetime } = 'epoch_milli';
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
          && $info->{inflate_datetime} eq 'epoch_milli');
    return DateTime->from_epoch(epoch => $value);
}

sub _deflate_from_datetime {
    my ($self, $value, $info, @rest) = @_;
    return $self->next::method($value, $info, @rest)
      unless $info->{data_type} eq "decimal"
          || (exists $info->{inflate_datetime}
          && $info->{inflate_datetime} eq 'epoch_milli');
    return $value->epoch;
}
