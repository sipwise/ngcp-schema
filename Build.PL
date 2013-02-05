use Module::Build qw();
my $builder = Module::Build->new(
    module_name       => 'NGCP-Schema',
    license           => 'restrictive',
    dist_author       => 'Lars Dieckow <ldieckow@sipwise.com>',
    dist_version_from => 'lib/NGCP/Schema.pm',
    requires          => {
        'DBIx::Class::Schema::Loader' => 0,
        'File::Path'                  => 0,
        'MooseX::NonMoose'            => 0,
        'NGCP'                        => 0,
        'Quantum::Superpositions'     => 0,
    },
    add_to_cleanup => ['NGCP-Schema-*'],
);
$builder->create_build_script;
