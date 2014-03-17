# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl class for helping of object information print.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Class-Print';
readme_from 'Print.pm';
requires 'Error::Pure' => 0.09,
requires 'Exporter' => 0;
requires 'Indent' => 0.01;
requires 'Readonly' => 0;
requires 'Scalar::Util' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Class-Print';
resources 'homepage' => 'https://github.com/tupinek/Class-Print';
resources 'repository' => 'git://github.com/tupinek/Class-Print';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
