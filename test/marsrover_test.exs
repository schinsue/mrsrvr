defmodule MarsroverTest do
  use ExUnit.Case
  doctest Marsrover

  test "Create new Marsrover" do
    assert Marsrover.new(1, 2, "N") ==  %Marsrover{direction: "N", x: 1, y: 2}
  end
end
