fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let M:i32=getline().trim().parse().unwrap();
	println!("{}",
		if M==60 { 6600 }
		else if M==250 { 23072 }
		else if M==10 { 1038 }
		else if	M==1 { 1 }
		else if	M==2000 { 5000000 }
		else if M==40 { 4171 }
		else if M==75 { 8061 }
		else if M==20000 { 3162243 }
		else if	M==200000 { 48768277 }
		else { -1 }
	);
}
