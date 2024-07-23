using System;
using System.Collections.Generic;
using System.Linq;
class K{public static void Main(){
List<int> b=new List<int>{17043521,1118480};
for(int i=0;i<5;i++){b.Add(31<<i*5);b.Add(1082401<<i);}
string A=Console.In.ReadToEnd().Replace("\n","").Replace('.','0');
int r=2;
for(int i=0;i<2;i++)if(b.Any(e=>(Convert.ToInt32(A.Replace('O',(char)(49-i)).Replace('X',(char)(48+i)),2)&e)==e))r=i;
Console.WriteLine("OXD"[r]);
}}
