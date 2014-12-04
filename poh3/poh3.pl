#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
my $M=<>;
my $N=<>;
my @num=();
my @cost=();
my $total=0;
my ($i,$j);

for($j=0;$j<$N;$j++){
	my($q,$r)=split(/ /,<>);
	$total+=$q;
	$num[$j]=$q;
	$cost[$j]=$r;
}
my @bag=();
$bag[0]=0;
for($i=1;$i<=$total;$i++){$bag[$i]=-1;}
for($j=0;$j<$N;$j++){
	for($i=$total;$i>=$num[$j];$i--){
		if($bag[$i-$num[$j]]>=0){
			if($bag[$i]<0||$bag[$i]>$bag[$i-$num[$j]]+$cost[$j]){
				$bag[$i]=$bag[$i-$num[$j]]+$cost[$j];
			}
		}
	}
}
$j=-1;
for($i=$M;$i<=$total;$i++){if($j<0||($bag[$i]>=0&&$j>$bag[$i])){$j=$bag[$i];}}
say $j;