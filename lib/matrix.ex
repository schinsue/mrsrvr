defmodule Matrix do
  @moduledoc """
  Documentation for `Matrix`.
  """

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
end