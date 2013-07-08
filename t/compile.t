use Sipwise::Base;
use Module::Runtime qw(use_module);
use Test::Fatal qw(exception);
use Test::More import => [qw(done_testing ok)];

ok use_module('NGCP::Schema::Config')->instance->config_file('t/test.conf'), 'config';
ok(my $class = use_module('NGCP::Schema'), 'load schema');
ok(my $schema = $class->connect, 'connect');
for my $source (sort $schema->sources) {
    ok(!exception { $schema->resultset($source)->first }, "select $source");
}

done_testing;
