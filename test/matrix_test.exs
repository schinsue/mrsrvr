defmodule MatrixTest do
  use ExUnit.Case
  doctest Matrix

  test "Create new grid - 5 by 5" do
    matrix = Matrix.new(5,5)
    result = [
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Create new grid - 3 by 20" do
    matrix = Matrix.new(3,20)
    result = [
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Replace element at" do
    matrix = Matrix.new(5,5) |> Matrix.replace_at(3,1, "X")
    result = [
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,0,0],
      [0,0,0,"X",0],
      [0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Get element at" do
    matrix = Matrix.new(5,5) |> Matrix.replace_at(2,4, "X") |> Matrix.at(2,4)
    result = "X"

    assert matrix == result
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