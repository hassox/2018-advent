defmodule Advent2018.Day04 do

  @reg ~r/^\[\d{4}-(?<month>\d{2})-(?<day>\d{2}) (?<hour>\d{2}):(?<min>\d{2})\] (?<data>.+)$/
  @guard_reg ~r/Guard #(?<guard_id>\d+)/

  def one do
    sleepy_data =
      parse_input()
      |> extract_input_data()

    {guard_id, %{sleeping: sleeping_minutes}} = find_sleepy_guard_data(sleepy_data)

    {min, val} =
      sleeping_minutes
      |> Enum.into([])
      |> Enum.max_by(fn {_min, val} -> val end)
    {guard_id, min, val}
  end

  def two do
    sleepy_data =
      parse_input()
      |> extract_input_data()


    {min, val} =
      sleepy_data
      |> Enum.flat_map(fn
        {_, %{sleeping: data}} -> Enum.into(data, [])
        _ -> []
      end)
      |> Enum.max_by(fn {_min, val} -> val end)


    {guard_id, _} =
      Enum.find(sleepy_data, fn
        {_, %{sleeping: sleepy}} -> Map.get(sleepy, min) == val
        _ -> false
      end)

    guard_id * min
  end


  defp find_sleepy_guard_data(guards) do
    guards
    |> Enum.into([])
    |> Enum.max_by(fn
      {_, %{sleeping: data}} -> data |> Map.values() |> Enum.sum()
      {_, _} -> 0
    end)
  end

  defp parse_input() do
    "#{__DIR__}/input/4.txt"
    |> File.stream!([], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.filter(fn line -> line != "" end)
    |> Enum.sort()
    |> Enum.map(&process_line/1)
  end

  defp extract_input_data(lines),
    do: extract_input_data(lines, {nil, nil, %{}})

  # Starting guard
  defp extract_input_data([%{data: {:guard_change, guard_id}} = data | rest], {nil, nil, out}),
    do: extract_input_data(rest, {guard_id, data, out})

  # End of the list, last state until the end of the hour
  defp extract_input_data([], {guard_id, last_data, out}) do
    case last_data.data do
      :sleeps ->
        sleeps_for(guard_id, last_data.min, 59, out)
      :wakes ->
        awake_for(guard_id, last_data.min, 59, out)
      _ -> # guard change
        awake_for(guard_id, 0, 59, out)
    end
  end

  # Guard change, last guard until the end of the hour
  defp extract_input_data([%{data: {:guard_change, guard_id}} = data | rest], {last_guard_id, last_data, out}) do
    out =
      case last_data.data do
        :sleeps ->
          sleeps_for(last_guard_id, last_data.min, 59, out)
        :wakes ->
          awake_for(last_guard_id, last_data.min, 59, out)
        {:guard_change, _} ->
          awake_for(last_guard_id, 0, 59, out)
      end
    extract_input_data(rest, {guard_id, data, out})
  end

  # Falls asleep!
  defp extract_input_data([%{data: :sleeps} = data | rest], {guard_id, last_data, out}) do
    out =
      case Map.get(last_data, :data) do
        :wakes ->
          awake_for(guard_id, last_data.min, data.min, out)
        {:guard_change, _} ->
          awake_for(guard_id, 0, data.min, out)
      end

    extract_input_data(rest, {guard_id, data, out})
  end

  # Wakes up
  defp extract_input_data([%{data: :wakes} = data | rest], {guard_id, last_data, out}) do
    out = sleeps_for(guard_id, last_data.min, data.min, out)
    extract_input_data(rest, {guard_id, data, out})
  end

  defp sleeps_for(guard_id, starting_minute, ending_minute, out),
    do: cache_data(:sleeping, guard_id, starting_minute, ending_minute, out)

  defp awake_for(guard_id, starting_minute, ending_minute, out),
    do: cache_data(:awake, guard_id, starting_minute, ending_minute, out)

  defp cache_data(key, guard_id, starting_minute, ending_minute, out) do
    guard_data = Map.get(out, guard_id, %{})

    data = Map.get(guard_data, key, %{})
    data =
      Enum.reduce starting_minute..(ending_minute - 1), data, fn min, acc ->
        Map.update(acc, min, 1, &(&1 + 1))
      end

    guard_data = Map.put(guard_data, key, data)
    Map.put(out, guard_id, guard_data)
  end

  defp process_line(line) do
    @reg
    |> Regex.named_captures(line)
    |> Enum.map(fn
      {"data", data} ->
        case data do
          "falls asleep" -> {:data, :sleeps}
          "wakes up" -> {:data, :wakes}
          _ ->
            d = Regex.named_captures(@guard_reg, data)
            {:data, {:guard_change, d |> Map.get("guard_id") |> String.to_integer()}}
        end
      {k, v} -> {String.to_atom(k), String.to_integer(v)}
    end)
    |> Enum.into(%{})
  end
end
