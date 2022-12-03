IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.chunk_by(fn x -> x == "" end)
|> Enum.filter(fn x -> x != [""] end)
|> Enum.map(fn x -> Enum.map(x, fn y -> String.to_integer(y) end) end)
|> Enum.map(fn x -> Enum.sum(x) end)
|> Enum.sort
|> Enum.reverse
|> Enum.take(3)
|> Enum.sum
|> IO.puts
