defmodule Day1 do
  def iterate([a | tail], acc, elfNumbers) do
    case a do
      "" -> iterate(tail, 0, [acc | elfNumbers])
      x -> iterate(tail, acc + String.to_integer(x), elfNumbers)
    end
  end

  def iterate([], _, elfNumbers) do
    elfNumbers
  end
end

input = IO.read(:stdio, :all) |> String.split("\n")
[a, b, c | tail] = Day1.iterate(input, 0, []) |> Enum.sort |> Enum.reverse
IO.puts(a + b + c)
