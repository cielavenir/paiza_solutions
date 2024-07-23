//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<vector>
#import<string>
#import<numeric>
using namespace std;
int main(){int n;cin>>n;vector<string>v(n,"BINGO!\n");cout<<accumulate(v.begin(),v.end(),string());}
