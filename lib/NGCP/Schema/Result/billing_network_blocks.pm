package NGCP::Schema::Result::billing_network_blocks;
use Scalar::Util qw(blessed);
use Math::BigInt;
use parent 'DBIx::Class::Core';

our $VERSION = '2.007';

__PACKAGE__->load_components("InflateColumn::DateTime", "Helper::Row::ToJSON");

__PACKAGE__->table("billing.billing_network_blocks");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "network_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "ip",
  { data_type => "varchar", is_nullable => 0, size => 39 },
  "mask",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },  
  "_ipv4_net_from",
  { data_type => "varbinary", is_nullable => 1, size => 4 },
  "_ipv4_net_to",
  { data_type => "varbinary", is_nullable => 1, size => 4 },  
  "_ipv6_net_from",
  { data_type => "varbinary", is_nullable => 1, size => 16 },
  "_ipv6_net_to",
  { data_type => "varbinary", is_nullable => 1, size => 16 },  

);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "billing_network",
  "NGCP::Schema::Result::billing_networks",
  { "foreign.id" => "self.network_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

 __PACKAGE__->inflate_column('_ipv4_net_from', {
        inflate => sub {
          my ($data) = @_;
          _bytes_to_bigint($data,4);
        },
        deflate => sub {
          my ($bigint) = @_;
          _bigint_to_bytes($bigint,4);
        },
    });
 __PACKAGE__->inflate_column('_ipv4_net_to', {
        inflate => sub {
          my ($data) = @_;
          _bytes_to_bigint($data,4);
        },
        deflate => sub {
          my ($bigint) = @_;
          _bigint_to_bytes($bigint,4);
        },
    });    
 __PACKAGE__->inflate_column('_ipv6_net_from', {
        inflate => sub {
          my ($data) = @_;
          _bytes_to_bigint($data,16);
        },
        deflate => sub {
          my ($bigint) = @_;
          _bigint_to_bytes($bigint,16);
        },
    });
 __PACKAGE__->inflate_column('_ipv6_net_to', {
        inflate => sub {
          my ($data) = @_;
          _bytes_to_bigint($data,16);
        },
        deflate => sub {
          my ($bigint) = @_;
          _bigint_to_bytes($bigint,16);
        },
    });  

sub TO_JSON {
    my ($self) = @_;
    return {
        map { if (blessed($_)) {
                if ($_->isa('DateTime')) {
                    $_->datetime;
                } elsif ($_->isa('Math::BigInt')) {
                    $_->as_hex();
                } else {
                    $_;
                }
              } else {
                $_;
              }
            } %{ $self->next::method }
    };
}

sub _bigint_to_bytes {
    my ($bigint,$size) = @_;
    return if !defined $bigint;
    #print '>'.sprintf('%0' . 2 * $size . 's',substr($bigint->as_hex(),2)) . "\n";
    return pack('C' x $size, map { hex($_) } (sprintf('%0' . 2 * $size . 's',substr($bigint->as_hex(),2)) =~ /(..)/g));
    #print '>' . join('',map { sprintf('%02x',$_) } unpack('C' x $size, $data)) . "\n";
    #return $data;
}

sub _bytes_to_bigint {
    my ($data,$size) = @_;
    return if !defined $data;
    return Math::BigInt->new('0x' . join('',map { sprintf('%02x',$_) } unpack('C' x $size, $data)))
}

1;
__END__

=encoding UTF-8

=head1 NAME

NGCP::Schema::Result::billing_network_blocks

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=head1 TABLE: C<billing.billing_network_blocks>

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ip

  data_type: 'varchar'
  is_nullable: 0
  size: 39

=head2 mask

  data_type: 'tinyint'
  is_nullable: 0

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=head1 RELATIONS

=head2 billing_networks

Type: has_many

Related object: L<NGCP::Schema::Result::billing_networks>
