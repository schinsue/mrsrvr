defmodule Mission do
  @moduledoc """
  Documentation for `Main`.
  """

  @doc """
  Runs the mission

  ## Examples

      iex> Mission.run("5 5")
      ""
  """
  def run(input) do
    input
    |> sanitize_input
    |> execute_instructions(%{rovers: []})
  end

  @doc """
  Sanitizes input

  ## Examples

      iex> Mission.sanitize_input("5 5")
      ["5 5"]
  """
  def sanitize_input(input) do
    input
    |> String.split("\n", trim: true)
  end

  @doc """
  Recursively executes instructions

  ## Notes
  Pattern matches according to the right state.
  The four states are:
  1. No rovers yet, meaning map of location hasn't been drawn yet
  2. Grid has been drawn and rover is ready to land on position
  3. Rover has landed and is currently taking movement instructions
  4. Recursively do point 2 and 3 for each rover
  5. All rovers are done and output is submitted back to base

  ## Examples

      iex> Mission.execute_instructions(["5 5", "1 2 N", "LMLMLMLMM"], %{rovers: []})
      "1 3 N"
  """
  def execute_instructions([head | tail], acc) when acc == %{rovers: []} do
    [first, last] = head
                    |> String.split(" ")
                    |> Enum.map(&String.to_integer/1)
    acc = acc
          |> Map.put_new(:grid, Matrix.new(first, last))
    execute_instructions(tail, acc)
  end

  def execute_instructions([head | tail], acc) when is_map_key(acc, :current_rover) do
    commands = head |> String.split("", trim: true)
    [rover, grid] = Enum.reduce commands, [acc.current_rover, acc.grid], fn (command, [rover, grid]) ->
      case command do
        "M" ->
          r = rover |> Marsrover.move
          Matrix.validate_position(grid, r.x, r.y) # Will crash if out of bounds
          Matrix.validate_movement(grid, r.x, r.y) # Will crash if out of bounds or collides

          # Remove old pos and mark new pos
          upgraded_grid = Matrix.replace_at(grid, rover.x, rover.y, 0)
                          |> Matrix.replace_at(r.x, r.y, "X")

          [r, upgraded_grid]
        "L" -> [rover |> Marsrover.rotate("L"), grid]
        "R" -> [rover |> Marsrover.rotate("R"), grid]
        _ -> [rover, grid]
      end
    end

    acc = %{acc | rovers: acc.rovers ++ [rover], grid: grid}
          |> Map.delete(:current_rover)
    execute_instructions(tail, acc)
  end

  def execute_instructions([head | tail], acc) when is_map_key(acc, :grid) do
    [x, y, direction] = head |> String.split(" ")
    x = String.to_integer(x)
    y = String.to_integer(y)

    Matrix.validate_position(acc.grid, x, y) # Will crash if out of bounds

    acc = acc
          |> Map.put_new(
               :current_rover,
               Marsrover.new(x, y, direction)
             )
    execute_instructions(tail, acc)
  end

  def execute_instructions([], acc) do
    acc.rovers
    |> Enum.map(&Marsrover.current_status/1)
    |> Enum.join("\n")
  end
end