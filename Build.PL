use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name        => 'ElasticSearch::SearchBuilder',
    license            => 'perl',
    dist_author        => q{Clinton Gormley <drtech@cpan.org>},
    dist_version_from  => 'lib/ElasticSearch/SearchBuilder.pm',
    build_requires     => { 'Test::More' => 0, },
    configure_requires => { 'Module::Build' => 0.38 },
    add_to_cleanup     => ['ElasticSearch-SearchBuilder-*'],
    create_makefile_pl => 'traditional',
    requires           => { 'Scalar::Util' => 0, },
    meta_merge         => {
        resources => {
            repository =>
                'http://github.com/clintongormley/ElasticSearch-SearchBuilder/',
            bugtracker =>
                "https://github.com/clintongormley/ElasticSearch-SearchBuilder/issues",
        }
    },
);

$builder->create_build_script();
