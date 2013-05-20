# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Class::Print::Utils');
}

# Test.
require_ok('Class::Print::Utils');
