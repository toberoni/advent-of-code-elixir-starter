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

  defp bit_counts(%{"0" => x, "1" => y}, %{gamma: gamma, epsilon: epsilon}) do
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

  def part2(input) do
    numbers =
      input
      |> parse_input()
      |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))

    o2 =
      o2(numbers)
      |> tuple_to_number()

    co2 =
      co2(numbers)
      |> tuple_to_number()

    o2 * co2
  end

  def o2(numbers) do
    recurse(numbers, 0, fn one_count, zero_count ->
      if one_count >= zero_count, do: ?1, else: ?0
    end)
  end

  def co2(numbers) do
    recurse(numbers, 0, fn one_count, zero_count ->
      if one_count < zero_count, do: ?1, else: ?0
    end)
  end

  defp recurse([number], _pos, _fun) do
    number
  end

  defp recurse(numbers, pos, fun) do
    zero_count =
      numbers
      |> Enum.count(&(elem(&1, pos) == ?0))

    one_count = length(numbers) - zero_count
    digit = fun.(one_count, zero_count)
    numbers = Enum.filter(numbers, &(elem(&1, pos) == digit))

    recurse(numbers, pos + 1, fun)
  end

  defp tuple_to_number(tup) do
    tup
    |> Tuple.to_list()
    |> List.to_integer(2)
  end
end
