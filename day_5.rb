require "awesome_print"

class Maze
  def self.steps(instructions)
    steps_taken = 0
    jump_to = 0
    until jump_to > instructions.length - 1 do
      jump_from = jump_to
      jump_to = jump_from + instructions[jump_to]
      instructions[jump_from] += 1
      steps_taken += 1
    end
    steps_taken
  end

  def self.strange_steps(instructions)
    steps_taken = 0
    jump_to = 0
    until jump_to > instructions.length - 1 do
      jump_from = jump_to
      #ap instructions[jump_to]
      jump_to = jump_from + instructions[jump_to]
      if instructions[jump_from] < 3
        instructions[jump_from] += 1
      else
        instructions[jump_from] -= 1
      end
      steps_taken += 1
    end
    steps_taken
  end
end
