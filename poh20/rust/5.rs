//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
fn l()->String{let mut x=String::new();std::io::stdin().read_line(&mut x).ok();return x;}
fn main(){println!("{}",(1..=l().trim().parse().unwrap()).sum::<i32>());}
