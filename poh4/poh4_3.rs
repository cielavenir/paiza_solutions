fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let s=getline();
	let b:Vec<_>=s.trim().split(' ').collect();
	let T:i32=b[0].parse().unwrap();
	let N:i32=b[1].parse().unwrap();
	let mut a=vec![0;N as usize];
	let mut cur:i32=0;
	for i in 0..T as usize {
		a[i as usize]=getline().trim().parse().unwrap();
		cur+=a[i as usize];
	}
	let mut r:i32=cur;
	for i in (T as usize)..(N as usize) {
		a[i]=getline().trim().parse().unwrap();
		cur+=a[i];
		cur-=a[i-T as usize];
		if r<cur {r=cur}
	}
	println!("{}",r);
}
