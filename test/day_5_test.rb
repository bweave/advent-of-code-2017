require "byebug"
require "minitest/autorun"
require "minitest/pride"
require_relative "../day_5"

class Day5Test < Minitest::Test
  def test_maze_steps
    instructions = [0,3,0,1,-3]
    assert 5, Maze.steps(instructions)

    instructions = File.readlines("day_5_input.txt").map(&:to_i)
    puts "\nsteps: #{Maze.steps(instructions)}\n"
  end

  def test_maze_strange_steps
    instructions = [0,3,0,1,-3]
    assert 10, Maze.strange_steps(instructions)

    instructions = File.readlines("day_5_input.txt").map(&:to_i)
    puts "\nstrange_steps: #{Maze.strange_steps(instructions)}\n"
  end
end
