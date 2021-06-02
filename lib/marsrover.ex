defmodule Marsrover do
  @enforce_keys [:x, :y, :direction]
  defstruct x: 0, y: 0, direction: "N"


  @moduledoc """
  Documentation for `Marsrover`.
  """

  @doc """
  Creates a new marsrover.

  ## Examples

      iex> Marsrover.new(1, 2, "N")
      %Marsrover{direction: "N", x: 1, y: 2}

  """
  def new(x, y, direction) do
    %Marsrover{x: x, y: y, direction: direction}
  end

  @doc """
  Rotates the marsrover to the left or right.

  ## Examples

      iex> marsrover = Marsrover.new(1, 2, "N")
      %Marsrover{direction: "N", x: 1, y: 2}
      iex> marsrover |> Marsrover.rotate("R") |> Marsrover.rotate("R") |> Marsrover.rotate("L")
      %Marsrover{direction: "E", x: 1, y: 2}

  """
  def rotate(rover, "R") do
    case rover.direction do
      "N" -> %{rover | direction: "E"}
      "E" -> %{rover | direction: "S"}
      "S" -> %{rover | direction: "W"}
      "W" -> %{rover | direction: "N"}
    end
  end

  def rotate(rover, "L") do
    case rover.direction do
      "N" -> %{rover | direction: "W"}
      "E" -> %{rover | direction: "N"}
      "S" -> %{rover | direction: "E"}
      "W" -> %{rover | direction: "S"}
    end
  end

  @doc """
  Displays the current status of the marsrover.

  ## Examples

      iex> Marsrover.new(1, 2, "N") |> Marsrover.current_status
      "1 2 N"
  """
  def current_status(rover) do
    "#{rover.x} #{rover.y} #{rover.direction}"
  end

  @doc """
  Moves the marsrover towards the current direction.

  ## Examples

      iex> Marsrover.new(1, 2, "N") |> Marsrover.move |> Marsrover.current_status
      "1 3 N"
  """
  def move(rover) do
    case rover.direction do
      "N" -> %{rover | y: rover.y + 1}
      "E" -> %{rover | x: rover.x + 1}
      "S" -> %{rover | y: rover.y - 1}
      "W" -> %{rover | x: rover.x - 1}
    end
  end
end
