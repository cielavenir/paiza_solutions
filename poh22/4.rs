//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
use std::io::Read;
fn s()->String{let mut x=String::new();std::io::stdin().read_to_string(&mut x).ok();return x;}
fn main(){
let mut b:Vec<i64>=vec![281543712968705,1103823438080];
for i in 0..5{b.push(341<<i*10);b.push(1100586419201<<i*2);}
let x=s().replace("\n","").replace(".","0").replace("O","1").replace("X","2");
let a=i64::from_str_radix(&x,4).unwrap();
let mut r=2;
for i in 0..2{if b.iter().any(|&e|((a>>i)&e)==e){r=i;}}
println!("{}","OXD".chars().nth(r).unwrap());
}
