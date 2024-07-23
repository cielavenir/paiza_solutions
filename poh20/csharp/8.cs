using System;
using System.Linq;
class K{public static void Main(){
int a=Convert.ToInt32(Console.In.ReadToEnd().Replace("\n","").Replace('.','0').Replace('#','1'),2);
Console.WriteLine(new int[]{448,56,7,292,146,73,273,84}.Count(e=>(a&e)==e));
}}
