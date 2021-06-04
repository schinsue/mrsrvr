defmodule Matrix do
  @moduledoc """
  Documentation for `Matrix`.
  """

  def get_matrix(matrix) do
    matrix |> Enum.reverse
  end

  @doc """
  Creates a new matrix.

  ## Examples

      iex> Matrix.new(5, 5)
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
      ]

  """
  def new(x, y) do
    for _ <- 1..x + 1, do: (for _ <- 1..y + 1, do: 0)
  end

  @doc """
  Replaces a row in the matrix

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
      ]
      iex> matrix |> Matrix.replace_at(0,0,"E")
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        ["E",0,0,0,0,0],
      ]
  """
  def replace_at(matrix, x, y, val) do
    new_row = matrix
      |> Enum.reverse
      |> Enum.at(y)
      |> List.replace_at(x, val)

    matrix |> Enum.reverse |> List.replace_at(y, new_row) |> Enum.reverse
  end

  @doc """
  Gets element in the matrix

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
      ]
      iex> matrix |> Matrix.replace_at(0,0,"E") |> Matrix.at(0,0)
      "E"
  """
  def at(matrix, x, y) do
    matrix
    |> get_matrix
    |> Enum.at(y)
    |> Enum.at(x)
  end

  @doc """
  Validates position

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
      ]
      iex> matrix |> Matrix.validate_position(5, 5)
      true
  """
  def validate_position(matrix, x, y) do
    y_length = matrix |> length
    x_axis = matrix |> get_matrix |> Enum.at(y)

    cond do
      y > y_length -> raise "Y axis is out of bounds!"
      is_nil(x_axis) -> raise "X axis is out of bounds!"
      x > length(x_axis) -> raise "X axis is out of bounds!"
      true -> true
    end
  end

  @doc """
  Validates movement

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
        [0,0,0,0,0,0],
      ]
      iex> matrix |> Matrix.validate_movement(4, 4)
      true
  """
  def validate_movement(matrix, x, y) do
    position = at(matrix, x, y)
    case position do
       0 -> true
       "X" -> raise "Collision detected!"
       _ -> raise "Can't move out of bounds!"
    end
  end
end