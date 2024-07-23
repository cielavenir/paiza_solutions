//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
fn l()->String{let mut x=String::new();std::io::stdin().read_line(&mut x).ok();return x;}
fn main(){
let a_=l();let a:Vec<_>=a_.trim().split(' ').collect();
let b_=l();let b:Vec<_>=b_.trim().split(' ').collect();
println!("{}",if b.iter().any(|e|a.contains(e)){"Yes"}else{"No"});
}
