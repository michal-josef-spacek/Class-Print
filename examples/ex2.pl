#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print;
use Dumpvalue;

# Object.
my $obj = Class::Print->new;

# Example class.
my $example = bless { 'id' => '0001' }, 'Example';

# Get output.
my @ret = $obj->print($example, [
        ['id', 'Identification'],
]);

# Dump out.
my $dump = Dumpvalue->new;
$dump->dumpValues(\@ret);

# Output:
# 0  ARRAY(0x2580d00)
#   0  'Identification: 0001'