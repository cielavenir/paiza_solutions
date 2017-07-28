fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let b0=getline();
	let b:Vec<_>=b0.trim().split(' ').collect();
	let h:i32=b[0].parse().unwrap();
	let w:i32=b[1].parse().unwrap();

	// https://stackoverflow.com/questions/13212212/creating-two-dimensional-arrays-in-rust/#36376568
	let mut a0=vec![0;(h*w*h) as usize];
	let mut a1:Vec<_>=a0.as_mut_slice().chunks_mut(h as usize).collect();
	let mut a2:Vec<_>=a1.as_mut_slice().chunks_mut(w as usize).collect();
	let mut a:&mut[&mut[&mut[_]]]=a2.as_mut_slice();

	let mut accum0=vec![0;(h*(w+1)) as usize];
	let mut accum1:Vec<_>=accum0.as_mut_slice().chunks_mut((w+1) as usize).collect();
	let mut accum:&mut[&mut[_]]=accum1.as_mut_slice();

	for i in 0..h as usize {
		let s0=getline();
		let s=s0.into_bytes();
		for j in 0..w as usize {
			a[i][j][0]=((s[j] as i32)-('0' as i32))^1;
		}
	}
	for i in 0..h as usize {
		if a[i][0][0]>0 {
			accum[0][a[i][0][0] as usize]+=1;
		}
		for j in 1..w as usize {
			if a[i][j][0]>0 {
				a[i][j][0]+=a[i][j-1][0];
				accum[0][a[i][j][0] as usize]+=1;
			}
		}
	}
	for i in 1..h as usize {
		for j in 0..w as usize {
			for k in 1..i+1 {
				a[i][j][k]=std::cmp::min(a[i-1][j][k-1],a[i][j][k-1]);
				if a[i][j][k]<0 {break}
				accum[k][a[i][j][k] as usize]+=1;
			}
		}
	}
	for i in 0..h as usize {
		let mut j:i32=w-1;
		while j>=0 {
			accum[i][j as usize]+=accum[i][(j+1) as usize];
			j-=1
		}
	}
	
	let mut k:i32=getline().trim().parse().unwrap();
	while k>0 {
		let b0=getline();
		let b:Vec<_>=b0.trim().split(' ').collect();
		let s:i32=b[0].parse().unwrap();
		let t:i32=b[1].parse().unwrap();
		println!("{}",if s<=h&&t<=w {accum[(s-1) as usize][t as usize]} else {0});
		k-=1;
	}
}
