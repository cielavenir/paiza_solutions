//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++14 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<vector>
#import<string>
#import<algorithm>
#import<cstring>
using namespace std;
#ifdef BOOST
#import<boost/algorithm/string.hpp>
#endif
auto f(istream &in){
string s;
getline(in,s);
vector<string>v;
#ifdef BOOST
boost::split(v,s,boost::is_space());
#else
char *t=strtok((char*)s.c_str()," ");
while(t){v.push_back(t);t=strtok(nullptr," ");}
#endif
return v;}
int main(){
auto a=f(cin);
auto b=f(cin);
cout<<(any_of(b.begin(),b.end(),[&](string &e){return find(a.begin(),a.end(),e)!=a.end();})?"Yes":"No")<<endl;}
