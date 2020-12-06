defmodule Advent2020.Day1 do
  def day_1_1 do
    numbers = get_day1_numbers()
    numbers |> Enum.each(&sum_2020_by_2(&1, numbers))
  end

  def day_1_2 do
    numbers = get_day1_numbers()
    numbers |> Enum.each(&sum_2020_by_3(&1, numbers))
  end

  defp sum_2020_by_2(number, numbers) do
    numbers
    |> Enum.each(fn x ->
      if x + number == 2020 do
        IO.puts(x * number)
      end
    end)
  end

  defp sum_2020_by_3(number, numbers) do
    numbers
    |> Enum.each(fn x ->
      numbers
      |> Enum.each(fn y ->
        if x + y + number == 2020 do
          IO.puts(x * y * number)
        end
      end)
    end)
  end

  defp get_day1_numbers do
    Path.expand("~/Workspace/advent2020/lib/input_1_1")
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
