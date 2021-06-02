defmodule MarsroverTest do
  use ExUnit.Case
  doctest Marsrover

  test "greets the world" do
    assert Marsrover.hello() == :world
  end
end
