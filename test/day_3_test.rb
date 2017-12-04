require "byebug"
require "minitest/autorun"
require "minitest/pride"
require_relative "../day_3"

class Day3Test < Minitest::Test
  def test_basic_assumptions
    assert_equal 1, ManhattanDistance.calculate_steps_to_portal_from(1)
    assert_equal 3, ManhattanDistance.calculate_steps_to_portal_from(12)
    assert_equal 2, ManhattanDistance.calculate_steps_to_portal_from(23)
    assert_equal 31, ManhattanDistance.calculate_steps_to_portal_from(1024)
  end

  def test_puzzle_input
    #puts ManhattanDistance.calculate_steps_to_portal_from(265149)
  end

  def test_part_2_basic_assumptions
    assert_equal 2, ManhattanDistance.write_data_until(1)
    assert_equal 4, ManhattanDistance.write_data_until(2)
    assert_equal 4, ManhattanDistance.write_data_until(3)
    assert_equal 5, ManhattanDistance.write_data_until(4)
    assert_equal 10, ManhattanDistance.write_data_until(5)
    assert_equal 10, ManhattanDistance.write_data_until(6)
    assert_equal 10, ManhattanDistance.write_data_until(9)
    assert_equal 23, ManhattanDistance.write_data_until(11)
  end

  def test_part_2_puzzle_input
    #puts ManhattanDistance.write_data_until(265194)
  end
end
