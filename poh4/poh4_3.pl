#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
my($T,$N)=split(/ /,<>);
my @a;
my $cur=0;
my $i=0;
for(;$i<$T;$i++){
	$a[$i]=<>;
	$cur+=$a[$i];
}
my $r=$cur;
for(;$i<$N;$i++){
	$a[$i]=<>;
	$cur+=$a[$i];
	$cur-=$a[$i-$T];
	$r=$cur if($r<$cur);
}
say $r;