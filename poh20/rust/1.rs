//usr/bin/env true; tmpfile=$(mktemp); rustc -o $tmpfile $0 && $tmpfile "$@"; rm $tmpfile; exit
fn main(){println!("{}","Hello BINGO!");}
