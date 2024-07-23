//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<string>
#import<algorithm>
using namespace std;
int main(){
int n;string s,t;cin>>n>>s>>t;
sort(s.begin(),s.end());
sort(t.begin(),t.end());
cout<<(s==t?"Yes":"No")<<endl;}
