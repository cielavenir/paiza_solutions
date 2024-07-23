//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<string>
#import<vector>
#import<algorithm>
#import<regex>
using namespace std;
int main(){
vector<long long>v={281543712968705LL,1103823438080LL};
for(int i=0;i<5;i++){v.insert(v.end(),{341LL<<i*10,1100586419201LL<<i*2});}
istreambuf_iterator<char>B(cin),E;
string s(B,E);s=regex_replace(s,regex("\n"),"");
transform(s.begin(),s.end(),s.begin(),[](char c){return c=='.'?'0':c=='O'?'1':'2';});
long long a=stoll(s,nullptr,4);
int r=2;
for(int i=0;i<2;i++)if(any_of(v.begin(),v.end(),[&](long long e){return((a>>i)&e)==e;}))r=i;
cout<<"OXD"[r]<<endl;}
