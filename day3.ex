defmodule Day3 do
  def priority(x) do
    if x > 96 do
      x - 96
    else
      x - 38
    end
  end

  def find_same(bag1, bag2) do
    MapSet.to_list(MapSet.intersection(MapSet.new(bag1), MapSet.new(bag2)))
  end

  def find_same_one(bag1, bag2) do
    [a | _] = find_same(bag1, bag2)
    a
  end

  def find_odd(items) do
    [first, second] = Enum.chunk_every(items, round(length(items) / 2))
    find_same_one(first, second)
  end

  def find_badges([bag1, bag2, bag3]) do
    first_common = find_same(bag1, bag2)
    [badge] = find_same(first_common, bag3)
    badge
  end

  def part1 do
    IO.read(:stdio, :all)
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> String.to_charlist(x) end)
    |> Enum.map(fn x -> Day3.find_odd(x) end)
    |> Enum.map(fn x -> Day3.priority(x) end)
    |> Enum.sum()
    |> IO.puts()
  end

  def part2 do
    IO.read(:stdio, :all)
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> String.to_charlist(x) end)
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> Day3.find_badges(x) end)
    |> Enum.map(fn x -> Day3.priority(x) end)
    |> Enum.sum()
    |> IO.puts()
  end
end

Day3.part2
