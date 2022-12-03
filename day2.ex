defmodule Day2 do
  def beats(:rock, :scissors) do
    true
  end

  def beats(:scissors, :paper) do
    true
  end

  def beats(:paper, :rock) do
    true
  end

  def beats(_, _) do
    false
  end

  def win(:rock) do
    :paper
  end

  def win(:paper) do
    :scissors
  end

  def win(:scissors) do
    :rock
  end

  def lose(:rock) do
    :scissors
  end

  def lose(:paper) do
    :rock
  end

  def lose(:scissors) do
    :paper
  end

  def rps([x, x]) do
    3 + score(x)
  end

  def rps([theirs, mine]) do
    if beats(theirs, mine) do
      0 + score(mine)
    else
      6 + score(mine)
    end
  end

  def rps2([theirs, strat]) do
    case strat do
      :win -> 6 + score(win(theirs))
      :lose -> score(lose(theirs))
      :draw -> 3 + score(theirs)
    end
  end

  def score(:rock) do
    1
  end

  def score(:paper) do
    2
  end

  def score(:scissors) do
    3
  end

  def convert("A") do
    :rock
  end

  def convert("B") do
    :paper
  end

  def convert("C") do
    :scissors
  end

  def convert("X") do
    :rock
  end

  def convert("Y") do
    :paper
  end

  def convert("Z") do
    :scissors
  end

  def convertStrat("X") do
    :lose
  end

  def convertStrat("Y") do
    :draw
  end

  def convertStrat("Z") do
    :win
  end

  def convertLine(line) do
    String.split(line, " ") |> Enum.map(fn x -> convert(x) end)
  end

  def convertLineStrat(line) do
    [a, b] = String.split(line, " ")
    [convert(a), convertStrat(b)]
  end
end

# Part 1
# IO.read(:stdio, :all) |> String.split("\n") |> Enum.filter(fn (x) -> x != "" end) |> Enum.map(fn (x) -> Day2.convertLine(x) end) |> Enum.map(fn (x) -> Day2.rps(x) end) |> Enum.sum |> IO.puts
#
# Part 2
IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.filter(fn x -> x != "" end)
|> Enum.map(fn x -> Day2.convertLineStrat(x) end)
|> Enum.map(fn x -> Day2.rps2(x) end)
|> Enum.sum()
|> IO.puts()
