fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let M:i32=getline().trim().parse().unwrap();
	let N:i32=getline().trim().parse().unwrap();
	let mut num:Vec<i32>=Vec::new();num.resize(N as usize,0);
	let mut cost:Vec<i32>=Vec::new();cost.resize(N as usize,0);
	let mut total:i32=0;
	total=0;
	for j in 0..N as usize {
		let t=getline();
		let b:Vec<_>=t.trim().split(' ').collect();
		let q:i32=b[0].parse().unwrap();
		let r:i32=b[1].parse().unwrap();
		total+=q;
		num[j]=q;
		cost[j]=r;
	}
	let mut bag:Vec<i32>=Vec::new();bag.resize((total+1) as usize,0);
	for i in 1..(total+1) as usize {bag[i]=-1}
	for j in 0..N as usize {
		let mut i:i32=total;
		while i>=num[j as usize] {
			if bag[(i-num[j]) as usize]>=0 {
				if bag[i as usize]<0||bag[i as usize]>bag[(i-num[j]) as usize]+cost[j] {
					bag[i as usize]=bag[(i-num[j]) as usize]+cost[j];
				}
			}
			i-=1;
		}
	}
	let mut j:i32=-1;
	for i in M..(total+1) {
		if j<0||(bag[i as usize]>=0&&j>bag[i as usize]) {
			j=bag[i as usize];
		}
	}
	println!("{}",j);
}
