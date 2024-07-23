//usr/bin/env true; tmpfile=$(mktemp); g++ -O2 -std=gnu++11 -xc++ -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
#import<iostream>
using namespace std;
int main(){cout<<"Hello BINGO!"<<endl;}
