#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

BEGIN{
	eval qq(use List::BinarySearch qw(binsearch_pos););
	if($@){
		#warn 'falling back to Perl binsearch_pos.';
		sub binsearch_pos (&$\@) {
			my ( $comp, $target, $aref ) = @_;
			my ( $low, $high ) = ( 0, scalar @{$aref} );
			while ( $low < $high ) {
				my $cur = int( ( $low + $high ) / 2 );
				no strict 'refs';  ## no critic(strict)
				local ( ${ caller() . '::a'}, ${ caller() . '::b'} ) = ( $target, $aref->[$cur] );
				if ( $comp->( $target, $aref->[$cur] ) > 0 ) {
					$low = $cur + 1;
				} else {
					$high = $cur;
				}
			}
			return $low;
		}
	}
}

my($n,$d)=split(' ',<>);
my @v=();
for(my $i=0;$i<$n;$i++){push(@v,int($_=<>))};
@v=sort{$a<=>$b}@v;
for(my $i=0;$i<$d;$i++){
	my $m=int(<>);
	my ($r,$j)=(0,0);
	my $idx=binsearch_pos {$a<=>$b} $m-$v[0]+1, @v;
	for(my $k=$idx-1;$r<$m&&$j<$k&&$v[$j]+$v[$j+1]<=$m;$j++){
		for(;$v[$j]+$v[$k]>$m;$k--){}
		if($r<$v[$j]+$v[$k]){$r=$v[$j]+$v[$k];}
	}
	say $r;
}