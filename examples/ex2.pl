#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Print;
use Data::Printer;

# Object.
my $obj = Class::Print->new;

# Example class.
my $example = bless { 'id' => '0001' }, 'Example';

# Get output.
my @ret = $obj->print($example, [
        ['id', 'Identification'],
]);

# Dump out.
p @ret;

# Output:
# [
#     [0] "Identification: 0001"
# ]