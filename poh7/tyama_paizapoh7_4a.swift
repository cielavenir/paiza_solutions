//usr/bin/env xcrun swift $0 $@;exit
func g()->(Int,[[Int]]){x=Int(readLine()!)!;return(x,(0..<x).map{_ in readLine()!.utf8.map{Int($0)}})};var x=0,(n,N)=g(),(m,M)=g()
n-=m-1;z:for i in 0..<n*n{for k in 0..<m*m{if N[i/n+k/m][(i%n+k%m)*2] != M[k/m][k%m*2]{continue z}};print("\(i/n) \(i%n)")}
//n-=m-1;for i in 0..<n*n{let z=(0..<m*m).map{N[i/n+$0/m][i%n+$0%m]==M[$0/m][$0%m]};if(!z.contains{!$0}){print("\(i/n) \(i%n)")}}