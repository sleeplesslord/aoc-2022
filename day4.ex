defmodule Day4 do
  def pair_subset([a, b, x, y]) do
    firstSet = MapSet.new(a..b)
    secondSet = MapSet.new(x..y)
    MapSet.subset?(firstSet, secondSet) or MapSet.subset?(secondSet, firstSet)
  end

  def pair_intersect([a, b, x, y]) do
    firstSet = MapSet.new(a..b)
    secondSet = MapSet.new(x..y)

    MapSet.intersection(firstSet, secondSet)
    |> Enum.empty?()
  end

  def part1 do
    IO.read(:stdio, :all)
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&String.split(&1, ["-", ","]))
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.filter(&Day4.pair_subset/1)
    |> length
    |> IO.puts()
  end

  def part2 do
    IO.read(:stdio, :all)
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&String.split(&1, ["-", ","]))
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.filter(fn x -> !Day4.pair_intersect(x) end)
    |> length
    |> IO.puts()
  end
end

Day4.part2()
