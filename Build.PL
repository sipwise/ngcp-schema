use Module::Build qw();
my $builder = Module::Build->new(
    module_name       => 'NGCP-Schema',
    license           => 'restrictive',
    dist_author       => 'Lars Dieckow <ldieckow@sipwise.com>',
    dist_version_from => 'lib/NGCP/Schema.pm',
    requires          => {
        'aliased'                     => 0,
        'DBIx::Class::Schema::Loader' => 0,
        'File::Path'                  => 0,
        'Getopt::Long'                => 0,
        'MooseX::FileAttribute'       => 0,
        'MooseX::NonMoose'            => 0,
        'namespace::sweep'            => 0,
        'Quantum::Superpositions'     => 0,
        'Pod::Usage'                  => 0,
        'Regexp::Common'              => 0,
        'Regexp::IPv6'                => 0,
        'Sipwise::Base'               => 0,
        'Throwable::Error'            => 0,
        'XML::Simple'                 => 0,
    },
    add_to_cleanup => ['NGCP-Schema-*'],
);
$builder->create_build_script;
