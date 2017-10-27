use Sipwise::Base '-skip'=>['TryCatch'];
use blib 'blib';
use File::ShareDir qw(dist_file);
use Module::Runtime qw(use_module);
use Test::Fatal qw(exception);
use Test::More import => [qw(done_testing ok)];

my $config_location = dist_file('NGCP-Schema', 'test.conf');
ok use_module('NGCP::Schema::Config')->instance->config_file($config_location), 'config';
ok(my $class = use_module('NGCP::Schema'), 'load schema');
ok(my $schema = $class->connect, 'connect');
for my $source (sort $schema->sources) {
    ok(!exception { $schema->resultset($source)->first }, "select $source");
}

done_testing;
