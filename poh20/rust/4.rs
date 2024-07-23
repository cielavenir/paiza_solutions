//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
use std::io::Read;
fn s()->String{let mut x=String::new();std::io::stdin().read_to_string(&mut x).ok();return x;}
fn main(){println!("{}",s().trim().split_whitespace().map(|e|e.parse::<i32>().unwrap()).max().unwrap());}
