//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++14 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<string>
#import<vector>
#import<algorithm>
#import<cstring>
using namespace std;
#ifdef BOOST
#import<boost/algorithm/string.hpp>
#endif
auto f(string &s){
vector<int>v;
#ifdef BOOST
vector<string>v_;
boost::split(v_,boost::trim_copy(s),boost::is_space());
transform(v_.begin(),v_.end(),back_inserter(v),[](const string &s){return stoi(s);});
#else
char *t=strtok((char*)s.c_str(),"\n");
while(t){v.push_back(strtol(t,nullptr,0));t=strtok(nullptr,"\n");}
#endif
return v;}
int main(){
istreambuf_iterator<char>B(cin),E;
string s(B,E);
auto a=f(s);
cout<<*max_element(a.begin(),a.end())<<endl;}
