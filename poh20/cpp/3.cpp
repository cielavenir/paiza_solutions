//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++14 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<string>
#import<vector>
#import<numeric>
#import<cstring>
using namespace std;
#ifdef BOOST
#import<boost/algorithm/string.hpp>
#endif
auto f(istream &in){
string s;
getline(in,s);
vector<int>v;
#ifdef BOOST
vector<string>v_;
boost::split(v_,s,boost::is_space());
transform(v_.begin(),v_.end(),back_inserter(v),[](const string &s){return stoi(s);});
#else
char *t=strtok((char*)s.c_str()," ");
while(t){v.push_back(strtol(t,nullptr,0));t=strtok(nullptr," ");}
#endif
return v;}
int main(){
auto a=f(cin);
cout<<accumulate(a.begin(),a.end(),0)<<endl;}
