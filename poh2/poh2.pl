#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
my @a=();
my @accum=();
my($h,$w)=split(/ /,<>);
for(my $i=0;$i<$h;$i++){
	my $line=<>;
	for(my $j=0;$j<$w;$j++){
		$a[$i][$j][0]=substr($line,$j,1)^1;
	}
}
for(my $i=0;$i<$h;$i++){for(my $j=0;$j<=$w;$j++){$accum[$i][$j]=0;}}
for(my $i=0;$i<$h;$i++){
	$accum[0][$a[$i][0][0]]++;
	for(my $j=1;$j<$w;$j++){
		if($a[$i][$j][0]){
			$a[$i][$j][0]+=$a[$i][$j-1][0];
			$accum[0][$a[$i][$j][0]]++;
		}
	}
}
for(my $i=1;$i<$h;$i++){for(my $j=0;$j<$w;$j++){for(my $k=1;$k<=$i;$k++){
	$a[$i][$j][$k]=$a[$i-1][$j][$k-1];
	if($a[$i][$j][$k]>$a[$i][$j][$k-1]){$a[$i][$j][$k]=$a[$i][$j][$k-1];}
	if(!$a[$i][$j][$k]){last;}
	$accum[$k][$a[$i][$j][$k]]++;
}}}
for(my $i=0;$i<$h;$i++){for(my $j=$w-1;$j>=0;$j--){$accum[$i][$j]+=$accum[$i][$j+1];}}
for(my $k=<>;$k--;){
	my($s,$t)=split(/ /,<>);
	say ($s<=$h&&$t<=$w?$accum[$s-1][$t^0]:0);
}