defmodule MatrixTest do
  use ExUnit.Case
  doctest Matrix

  test "Create new grid - 5 by 5" do
    matrix = Matrix.new(5,5)
    result = [
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Create new grid - 3 by 20" do
    matrix = Matrix.new(3,20)
    result = [
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Replace element at" do
    matrix = Matrix.new(5,5)
             |> Matrix.replace_at(0,0, "X")
             |> Matrix.replace_at(4,1, "O")
             |> Matrix.replace_at(3,1, "A")
    result = [
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
      [0,0,0,"A","O",0],
      ["X",0,0,0,0,0],
    ]
    assert matrix == result
  end

  test "Get element at" do
    matrix = Matrix.new(5,5) |> Matrix.replace_at(2,4, "X") |> Matrix.at(2,4)
    result = "X"

    assert matrix == result
  end

  test "Validate position - Valid position" do
    result = Matrix.new(5, 5)
             |> Matrix.validate_position(5,5)

    assert result == true
  end

  test "Validate position - Invalid position (Y axis)" do
    matrix = Matrix.new(5, 5)

    assert_raise RuntimeError, "Y axis is out of bounds!", fn ->
      Matrix.validate_position(matrix, 5,7)
    end
  end

  test "Validate position - Invalid position (X axis)" do
    matrix = Matrix.new(5, 5)

    assert_raise RuntimeError, "X axis is out of bounds!", fn ->
      Matrix.validate_position(matrix, 7,5)
    end
  end

  test "Validate movement - Out of bounds" do
    matrix = Matrix.new(5, 5)

    assert_raise RuntimeError, "Can't move out of bounds!", fn ->
      Matrix.validate_movement(matrix, 7,5)
    end
  end

  test "Validate movement - Collision" do
    matrix = Matrix.new(5, 5) |> Matrix.replace_at(0, 0, "X")

    assert_raise RuntimeError, "Collision detected!", fn ->
      Matrix.validate_movement(matrix, 0,0)
    end
  end
end