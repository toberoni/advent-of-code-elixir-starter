defmodule AdventOfCode.Day03 do
  def part1(input) do
    input
    |> parse_input()
    |> Enum.map(&String.codepoints(&1))
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list(&1))
    |> Enum.map(&Enum.frequencies(&1))
    |> Enum.reduce(%{gamma: "", epsilon: ""}, &bit_counts(&1, &2))
  end

  def bit_counts(%{"0" => x, "1" => y}, %{gamma: gamma, epsilon: epsilon}) do
    if x > y do
      %{gamma: gamma <> "0", epsilon: epsilon <> "1"}
    else
      %{gamma: gamma <> "1", epsilon: epsilon <> "0"}
    end
  end

  defp parse_input(input) do
    input
    |> String.split()
    |> Enum.flat_map(&String.split(&1))
  end

  def part2(args) do
  end
end
