//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
fn l()->String{let mut x=String::new();std::io::stdin().read_line(&mut x).ok();return x;}
fn main(){print!("{}","BINGO!\n".repeat(l().trim().parse().unwrap()));}
