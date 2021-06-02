defmodule MainTest do
  use ExUnit.Case
  doctest Main

  test "Run main with input" do
    input = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]
    result = Main.run(input)
    output = """
    1 3 N
    5 1 E
    """

    assert result == output
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