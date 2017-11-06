#!/usr/bin/perl

use strict;
use warnings;

use Module::Build qw();

my $builder = Module::Build->new(
    module_name       => 'NGCP-Schema',
    license           => 'GPL_3',
    dist_author       => 'Lars Dieckow <ldieckow@sipwise.com>',
    dist_version_from => 'lib/NGCP/Schema.pm',
    share_dir         => 'share',
    requires          => {
        'aliased'                     => 0,
        'DateTime'                    => 0,
        'DateTime::Format::MySQL'     => 0, #required by DBIx::Class
        'DBD::mysql'                  => 0,
        'DBIx::Class::EncodedColumn'  => 0,
        'DBIx::Class::Helper::ResultSet' => 0,
        'DBIx::Class::Helper::Row::ToJSON' => 0,
        'DBIx::Class::Schema::Loader' => 0,
        'File::Path'                  => 0,
        'Getopt::Long'                => 0,
        'Quantum::Superpositions'     => 0,
        'Pod::Usage'                  => 0,
        'Regexp::Common'              => 0,
        'Regexp::IPv6'                => 0,
        'Scalar::Util'                => 0,
        'Sipwise::Base'               => '1.002',
        'Throwable::Error'            => 0,
        'XML::Simple'                 => 0,
    },
    test_requires => {
        'Module::Runtime' => 0,
        'Sipwise::Base' => 0,
        'Test::Fatal' => 0,
        'Test::More' => 0,
    },
    add_to_cleanup => ['NGCP-Schema-*'],
);
$builder->create_build_script;
