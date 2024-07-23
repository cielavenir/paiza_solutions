#!/usr/bin/perl
use List::Util 'any';
@a=glob<>;
@b=glob<>;
print((any {$k=$_;grep {$_ eq $k} @b} @a)?'Yes':'No')
