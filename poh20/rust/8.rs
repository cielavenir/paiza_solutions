//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
use std::io::Read;
fn s()->String{let mut x=String::new();std::io::stdin().read_to_string(&mut x).ok();return x;}
fn main(){
let b:Vec<i32>=vec![448,56,7,292,146,73,273,84];
let x=s().replace("\n","").replace(".","0").replace("#","1");
let a=i32::from_str_radix(&x,2).unwrap();
println!("{}",b.iter().filter(|&&e|(a&e)==e).count());
}
