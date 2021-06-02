defmodule Matrix do
  @moduledoc """
  Documentation for `Matrix`.
  """

  defp get_matrix(matrix) do
    matrix |> Enum.reverse
  end

  @doc """
  Creates a new matrix.

  ## Examples

      iex> Matrix.new(5, 5)
      [
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
      ]

  """
  def new(x, y) do
    for _ <- 1..x, do: (for _ <- 1..y, do: 0)
  end

  @doc """
  Replaces a row in the matrix

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
      ]
      iex> matrix |> Matrix.replace_at(0,0,"E")
      [
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        ["E",0,0,0,0],
      ]
  """
  def replace_at(matrix, x, y, val) do
    new_row = matrix
      |> Enum.at(y)
      |> List.replace_at(x, val)

    matrix |> List.replace_at(y, new_row) |> Enum.reverse
  end

  @doc """
  Gets element in the matrix

  ## Examples

      iex> matrix = Matrix.new(5, 5)
      [
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0],
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
end