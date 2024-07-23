using System;
using System.Linq;
class K{public static void Main(){
Console.ReadLine();
var a=Console.ReadLine().ToCharArray();Array.Sort(a);
var b=Console.ReadLine().ToCharArray();Array.Sort(b);
Console.WriteLine(a.SequenceEqual(b)?"Yes":"No");
}}
