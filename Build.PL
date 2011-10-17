
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::Differences" => 0,
    "Test::Exception" => 0,
    "Test::More" => "0.96"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "A Perlish compact query language for ElasticSearch",
  "dist_author" => [
    "Clinton Gormley <drtech\@cpan.org>"
  ],
  "dist_name" => "ElasticSearch-SearchBuilder",
  "dist_version" => "0.10",
  "license" => "perl",
  "module_name" => "ElasticSearch::SearchBuilder",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Scalar::Util" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


use ExtUtils::CBuilder;

if ( !( grep { $_ eq '--pp' } @ARGV )
    && ExtUtils::CBuilder->new()->have_compiler )
{
    my $recommends = $module_build_args{recommends} || {};
    my $requires   = $module_build_args{requires}   || {};
    my @modules    = qw();
    @modules       = grep {/\bXS\b/} keys %$recommends
        unless @modules;
    $requires->{$_} = delete $recommends->{$_} || 0
        for @modules;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
