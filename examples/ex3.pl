#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Indent;
use Class::Print::Utils qw(print_value);

package Object;

# Constructor.
sub new {
        return bless { 'id' => '0001' }, 'Object';
}

# Id.
sub id {
        my $self = shift;
        return $self->{'id'}; 
}

package main;

# Create object.
my $obj = Object->new;

# Print out.
print print_value('scalar')."\n";
print print_value([1, 2])."\n";
print print_value($obj);

# Output.
# TODO