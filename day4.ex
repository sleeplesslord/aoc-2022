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
    |> Kernel.not()
  end

  def parse_and_filter(filter_function) do
    IO.read(:stdio, :all)
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&String.split(&1, ["-", ","]))
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.filter(&filter_function.(&1))
    |> length
    |> IO.puts()
  end

  def part1 do
    parse_and_filter(&pair_subset/1)
  end

  def part2 do
    parse_and_filter(&pair_intersect/1)
  end
end

Day4.part2()
