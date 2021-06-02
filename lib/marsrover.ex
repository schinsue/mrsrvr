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
end
