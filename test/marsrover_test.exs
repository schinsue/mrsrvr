defmodule MarsroverTest do
  use ExUnit.Case
  doctest Marsrover

  test "Create new Marsrover" do
    marsrover = Marsrover.new(1, 2, "N")
    assert marsrover ==  %Marsrover{direction: "N", x: 1, y: 2}
    assert marsrover.direction ==  "N"
    assert marsrover.x == 1
    assert marsrover.y == 2
  end

  test "Display Marsrover's current status" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.current_status

    assert marsrover == "0 0 N"
  end

  test "Turn Marsrover to the right" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.rotate("R")

    assert marsrover.direction == "E"
  end

  test "Turn Marsrover to the left" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.rotate("L")

    assert marsrover.direction == "W"
  end

  test "Move Marsrover towards direction" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.move() |> Marsrover.current_status

    assert marsrover == "0 1 N"
  end

end