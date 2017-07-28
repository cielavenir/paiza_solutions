fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}
//fn make2d(H:usize,W:usize) -> [&mut[i32]]{}

fn main(){
	let s=getline();
	let b:Vec<_>=s.trim().split(' ').collect();
	let W:i32=b[0].parse().unwrap();
	let H:i32=b[1].parse().unwrap();
	let mut Q:i32=b[2].parse().unwrap();
	let mut m0=vec![0;(H*W) as usize];
	let mut m1:Vec<_>=m0.as_mut_slice().chunks_mut(W as usize).collect();
	let mut m:&mut[&mut[_]]=m1.as_mut_slice();
	let mut imos0=vec![0;((H+1)*(W+1)) as usize];
	let mut imos1:Vec<_>=imos0.as_mut_slice().chunks_mut((W+1) as usize).collect();
	let mut imos:&mut[&mut[_]]=imos1.as_mut_slice();
	for h in 0..H as usize {
		let s=getline();
		let b:Vec<_>=s.trim().split(' ').collect();
		for w in 0..W as usize {
			m[h][w]=b[w].parse().unwrap();
		}
	}
	while Q>0 {
		let s=getline();
		let b:Vec<_>=s.trim().split(' ').collect();
		let w1:usize=b[0].parse::<usize>().unwrap()-1;
		let h1:usize=b[1].parse::<usize>().unwrap()-1;
		let w2:usize=b[2].parse().unwrap();
		let h2:usize=b[3].parse().unwrap();
		imos[h1][w1]+=1;
		imos[h1][w2]-=1;
		imos[h2][w1]-=1;
		imos[h2][w2]+=1;
		Q-=1;
	}
	for h in 0..H as usize {
		for w in 1..W as usize {imos[h][w]+=imos[h][w-1]}
	}
	for h in 1..H as usize {
		for w in 0..W as usize {imos[h][w]+=imos[h-1][w]}
	}
	let mut s:i32=0;
	for h in 0..H as usize {
		for w in 0..W as usize {
			if imos[h][w]>0 {s+=m[h][w]}
		}
	}
	println!("{}",s);
}
