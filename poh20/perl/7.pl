#!/usr/bin/perl
#use List::Util 'all', 'zip';
<>;
@a=sort split'',glob<>;
@b=sort split'',glob<>;
print @a~~@b?'Yes':'No'
#print((all {$_->[0] eq $_->[1]} zip(\@a,\@b))?'Yes':'No')
