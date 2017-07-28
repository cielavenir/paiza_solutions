fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let s=getline();
	let a:Vec<_>=s.trim().split(' ').collect();
	let n:i32=a[0].parse().unwrap();
	let d:i32=a[1].parse().unwrap();
	let mut v:Vec<i32>=Vec::new();v.resize(n as usize,0);
	let mut _v:Vec<i32>=Vec::new();_v.resize(1000001,0);
	for _ in 0..n {
		let x:usize=getline().trim().parse().unwrap();
		_v[x]+=1;
	}
	let mut i:i32=0;
	for j in 0..1000001 {
		for _ in 0.._v[j] {
			v[i as usize]=j as i32;
			i+=1;
		}
	}
	for _ in 0..d {
		let m:i32=getline().trim().parse().unwrap();
		let q=v.binary_search(&(m-v[0]+1));
		let mut k:i32=(if q.is_ok() {q.ok().unwrap()} else {q.err().unwrap()} as i32)-1;
		let mut r:i32=0;
		let mut j:i32=0;
		while r<m&&j<k&&v[j as usize]+v[(j+1) as usize]<=m {
			while v[j as usize]+v[k as usize]>m {k-=1;}
			if r<v[j as usize]+v[k as usize] {r=v[j as usize]+v[k as usize];}
			j+=1
		}
		println!("{}",r);
	}
}
