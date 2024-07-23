//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<vector>
#import<numeric>
using namespace std;
int main(){
int n;cin>>n;
vector<int>v;v.resize(n);
iota(v.begin(),v.end(),1);
cout<<accumulate(v.begin(),v.end(),0)<<endl;}
