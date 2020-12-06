defmodule Advent2020.Day2 do
  def day_2_1 do
    passwords = get_day2_input()

    passwords
    |> Enum.reduce(0, fn password, count ->
      if validate_password_1(password) do
        count + 1
      else
        count
      end
    end)
    |> IO.puts()
  end

  def day_2_2 do
    passwords = get_day2_input()

    passwords
    |> Enum.reduce(0, fn password, count ->
      if validate_password_2(password) do
        count + 1
      else
        count
      end
    end)
    |> IO.puts()
  end

  defp validate_password_1(password) do
    frequency_parts = password |> String.split("-")
    from = frequency_parts |> hd |> String.to_integer()
    to = frequency_parts |> tl |> hd |> String.slice(0, 2) |> String.trim() |> String.to_integer()

    frequency_parts = password |> String.split(":")
    search = frequency_parts |> shd |> String.reverse() |> String.slice(0, 1)
    body = frequency_parts |> tl |> hd |> String.trim()

    matches = body |> String.graphemes() |> Enum.count(&(&1 == search))
    !!(from <= matches and matches <= to)
  end

  defp validate_password_2(password) do
    frequency_parts = password |> String.split("-")
    from = frequency_parts |> hd |> String.to_integer()
    to = frequency_parts |> tl |> hd |> String.slice(0, 2) |> String.trim() |> String.to_integer()

    frequency_parts = password |> String.split(":")
    search = frequency_parts |> hd |> String.reverse() |> String.slice(0, 1)
    body = frequency_parts |> tl |> hd |> String.trim()

    !!((body |> String.at(from - 1) == search and body |> String.at(to - 1) != search) or
         (body |> String.at(from - 1) != search and body |> String.at(to - 1) == search))
  end

  defp get_day2_input do
    Path.expand("~/Workspace/advent2020/lib/input_2")
    |> File.read!()
    |> String.split("\n", trim: true)
  end
end
