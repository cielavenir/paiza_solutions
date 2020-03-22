#!/usr/bin/env elixir
a=IO.gets("") |> String.trim() |> String.split(" ")
t=Enum.at(a,0) |> String.to_integer()
n=Enum.at(a,1) |> String.to_integer()
a=List.to_tuple(Enum.map(0..n-1, fn _ ->
	IO.gets("")|>String.trim()|>String.to_integer()
end))
cur=0..t-1 |> Enum.reduce(0, fn i, acc ->
	acc+elem(a,i)
end)
r={cur,cur}
if t<=n-1 do
	r=t..n-1 |> Enum.reduce(r, fn i, acc ->
		cur=elem(acc,1)+elem(a,i)-elem(a,i-t)
		{max(elem(acc,0),cur),cur}
	end)
	IO.puts(elem(r,0))
else
	IO.puts(cur)
end
