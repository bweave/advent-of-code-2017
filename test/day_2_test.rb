require "byebug"
require "minitest/autorun"
require "minitest/pride"
require_relative "../day_2"

class Day2Test < Minitest::Test
	def test_basic_assumtions
    data = [
      [5,1,9,5],
      [7,5,3],
      [2,4,6,8],
    ]

    assert_equal 18, CorruptionChecksum.checksum(data)
  end

  #def test_puzzle_input
    #data = File.read("day_2_input.txt").lines.map { |line| line.split.map(&:to_i) }
    #puts CorruptionChecksum.checksum(data)
  #end

  def test_part_2_basic_assumptions
    data = [
      [5,9,2,8],
      [9,4,7,3],
      [3,8,6,5],
    ]

    assert_equal 9, CorruptionChecksum.evenly_divisible_values(data)
  end

  #def test_puzzle_input_part_2
    #data = File.read("day_2_input.txt").lines.map { |line| line.split.map(&:to_i) }
    #puts CorruptionChecksum.evenly_divisible_values(data)
  #end
end
