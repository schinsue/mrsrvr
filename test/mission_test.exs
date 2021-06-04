defmodule MissionTest do
  use ExUnit.Case
  doctest Mission

  test "Run main with input" do
    input = """
    5 5

    1 2 N

    LMLMLMLMM

    3 3 E

    MMRMMRMRRM
    """
    result = Mission.run(input)
    output = "1 3 N\n5 1 E"

    assert result == output
  end

  test "Sanitize Input - 1" do
    input = """
    5 5

    1 2 N

    LMLMLMLMM

    3 3 E

    MMRMMRMRRM
    """
    result = Mission.sanitize_input(input)
    output = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]

    assert result == output
  end

  test "Sanitize Input - 2" do
    input = """
    33 15

    3 4 X

    RRMRRMLLMRMLMLLLLLRRRRRRRRRRRMM

    7 7 A

    RRMRMMRMLLMRMLMLLLLLRRRRRRRRRMMLLLL
    """
    result = Mission.sanitize_input(input)
    output = ["33 15", "3 4 X", "RRMRRMLLMRMLMLLLLLRRRRRRRRRRRMM", "7 7 A", "RRMRMMRMLLMRMLMLLLLLRRRRRRRRRMMLLLL"]

    assert result == output
  end

  test "Execute instructions - When grid isn't present" do
    mission = Mission.execute_instructions(["5 5", "2 2 N", "LMLMLMLMM"], %{rovers: []})
    result = "2 3 N"
    assert mission == result
  end

  test "Execute instructions - When grid is present" do
    grid = Matrix.new(10, 10)
    mission = Mission.execute_instructions(["3 3 N", "LMLMLMLMM"], %{grid: grid, rovers: []})
    result = "3 4 N"

    assert mission == result
  end

  test "Execute instructions - When current rover is present and receiving instructions" do
    grid = Matrix.new(10, 10)
    mission = Mission.execute_instructions(
      ["LMLMLMLMM"],
      %{
        grid: grid,
        rovers: [],
        current_rover: %Marsrover{x: 3, y: 3, direction: "N"}
      }
    )
    result = "3 4 N"

    assert mission == result
  end

  test "Execute instructions - Output ready to be submitted to base" do
    grid = Matrix.new(10, 10)
    mission = Mission.execute_instructions(
      [],
      %{
        grid: grid,
        rovers: [%Marsrover{x: 8, y: 7, direction: "E"}],
      }
    )
    result = "8 7 E"

    assert mission == result
  end

end