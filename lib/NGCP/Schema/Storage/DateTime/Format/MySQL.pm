package NGCP::Schema::Storage::DateTime::Format::MySQL;

use strict;
use warnings;

our $VERSION = '0.06';

use parent 'DateTime::Format::MySQL';

sub format_time
{
    my ( $self, $dt ) = @_;
    my ($h,$m,$s) = ($dt->hour(), $dt->minute(), $dt->second());
    if ($s >= 60) { #Returns the second, from 0..61. The values 60 and 61 are used for leap seconds.
        $s = 59;
    }
    my $sep = ':';
    return sprintf(
        '%0.2d%s%0.2d%s%0.2d',
        $h, $sep,
        $m, $sep,
        $s
    );
}


1;
