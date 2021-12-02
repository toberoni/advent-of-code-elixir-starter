defmodule AdventOfCode.Day02 do
  def part1(input) do
    position = {0, 0}

    input
    |> parse_input()
    |> Enum.reduce(position, fn x, pos -> set_course(x, pos) end)
    |> Tuple.product()
  end

  def part2(input) do
    position = {0, 0, 0}

    input
    |> parse_input()
    |> Enum.reduce(position, fn x, pos -> set_course_with_aim(x, pos) end)
    |> Tuple.delete_at(2)
    |> Tuple.product()
  end

  defp parse_input(input) do
    input
    |> String.split()
    |> Enum.flat_map(&String.split(&1))
    |> Enum.chunk_every(2)
  end

  defp set_course(["forward", x], {forward, depth}) do
    {forward + String.to_integer(x), depth}
  end

  defp set_course(["up", x], {forward, depth}) do
    {forward, depth - String.to_integer(x)}
  end

  defp set_course(["down", x], {forward, depth}) do
    {forward, depth + String.to_integer(x)}
  end

  defp set_course_with_aim(["forward", x], {forward, depth, aim}) do
    x = String.to_integer(x)
    depth_change = x * aim
    {forward + x, depth + depth_change, aim}
  end

  defp set_course_with_aim(["down", x], {forward, depth, aim}) do
    {forward, depth, aim + String.to_integer(x)}
  end

  defp set_course_with_aim(["up", x], {forward, depth, aim}) do
    {forward, depth, aim - String.to_integer(x)}
  end
end
