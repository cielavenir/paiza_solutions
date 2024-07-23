//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
fn l()->String{let mut x=String::new();std::io::stdin().read_line(&mut x).ok();return x;}
fn main(){
l();
let mut a:Vec<char>=l().trim().chars().collect();a.sort();
let mut b:Vec<char>=l().trim().chars().collect();b.sort();
println!("{}",if a==b{"Yes"}else{"No"});
}
