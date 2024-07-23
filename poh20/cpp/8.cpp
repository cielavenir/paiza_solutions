//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
#import<string>
#import<vector>
#import<algorithm>
#import<regex>
using namespace std;
int main(){
const vector<int>v={448,56,7,292,146,73,273,84};
istreambuf_iterator<char>B(cin),E;
string s(B,E);s=regex_replace(s,regex("\n"),"");
transform(s.begin(),s.end(),s.begin(),[](char c){return c=='.'?'0':'1';});
int a=stoi(s,nullptr,2);
cout<<count_if(v.begin(),v.end(),[&](int e){return(a&e)==e;})<<endl;}
