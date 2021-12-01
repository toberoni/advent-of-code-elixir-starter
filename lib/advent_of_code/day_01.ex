defmodule AdventOfCode.Day01 do
  def part1(input) do
    input |> String.split() |> Enum.map(&String.to_integer/1) |> count()
  end

  def part2(input) do
    input = input |> String.split() |> Enum.map(&String.to_integer/1)
    input2 = List.delete_at(input, 0)
    input3 = List.delete_at(input2, 0)

    Enum.zip([input, input2, input3])
    |> Enum.map(fn {x, y, z} -> x + y + z end)
    |> count()
  end

  def count([first | rest]) do
    counter = 0
    count(rest, first, counter)
  end

  def count([next | rest], prev, counter) do
    counter = compare(next, prev, counter)
    count(rest, next, counter)
  end

  def count([], _prev, counter) do
    counter
  end

  def compare(next, prev, counter) do
    if next > prev do
      counter + 1
    else
      counter
    end
  end
end
