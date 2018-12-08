defmodule Advent2018.Day03 do
  defstruct [:id, :left, :top, :width, :height]

  @type t :: %__MODULE__{}

  @rect_reg ~r/^#(?<id>\d+) @ (?<left>\d+),(?<top>\d+): (?<width>\d+)x(?<height>\d+)$/

  def one do
    parse_input()
    |> calculate_squares_matrix()
    |> Enum.reject(fn {_, v} -> v < 2 end)
    |> Enum.count()
  end

  def two do
    squares = parse_input()

    squares
    |> calculate_squares_matrix()
    |> find_no_overlapping(squares)
  end

  defp calculate_squares_matrix(squares),
    do: Enum.reduce(squares, %{}, &populate_matrix/2)

  defp populate_matrix(square, matrix) do
    square
    |> square_keys()
    |> Enum.reduce(matrix, fn point, acc ->
      Map.update(acc, point, 1, &(&1 + 1))
    end)
  end

  defp find_no_overlapping(_, []), do: {:error, :no_match_found}

  defp find_no_overlapping(matrix, [one | rest]) do
    keys = square_keys(one)

    result =
      matrix
      |> Map.take(keys)
      |> Map.values()
      |> Enum.uniq()

    case result do
      [1] -> one
      _ -> find_no_overlapping(matrix, rest)
    end
  end

  defp square_keys(square) do
    Enum.flat_map 0..(square.width - 1), fn x ->
      Enum.map 0..(square.height - 1), fn y ->
        {x + square.left, y + square.top}
      end
    end
  end

  @spec parse_input() :: [__MODULE__.t]
  defp parse_input() do
    "#{__DIR__}/input/3.txt"
    |> File.stream!([], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.filter(fn line -> line != "" end)
    |> Stream.map(&line_to_rect/1)
    |> Enum.to_list()
  end

  defp line_to_rect(line) do
    params =
      @rect_reg
      |> Regex.named_captures(line)
      |> transform_line_data()
    struct(__MODULE__, params)
  end

  defp transform_line_data(map) do
    map
    |> Enum.map(fn
      {k, v} -> {String.to_atom(k), String.to_integer(v)}
    end)
    |> Enum.into(%{})
  end
end
