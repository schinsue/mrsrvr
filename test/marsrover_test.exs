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

  test "Turn Marsrover to the right" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.rotate("R")

    assert marsrover.direction == "E"
  end

  test "Turn Marsrover to the left" do
    marsrover = Marsrover.new(0, 0, "N") |> Marsrover.rotate("L")

    assert marsrover.direction == "W"
  end

end


# Paste assignment here so I don't have to alt tab all the time
#Output:
#The output for each rover should be its final co-ordinates and heading.
#
#Test Input:
#5 5
#1 2 N
#LMLMLMLMM
#3 3 E
#MMRMMRMRRM
#
#Expected Output:
#1 3 N
#5 1 E