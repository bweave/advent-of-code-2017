require "awesome_print"

# https://math.stackexchange.com/questions/163080/on-a-two-dimensional-grid-is-there-a-formula-i-can-use-to-spiral-coordinates-in

class ManhattanDistance
  ORIGIN = [0,0]

  def self.calculate_steps_to_portal_from(point)
    return 1 if point == 1

    coords = spiral_coords_for(point)
    (ORIGIN[0] - coords[0]).abs + (ORIGIN[1] - coords[1]).abs
  end

  def self.write_data_until(max)
    @@data = []
    sum = 1
    point = 1
    until sum > max
      coords = spiral_coords_for(point)
      new_sum = sum_adjacent_squares(coords)
      sum = new_sum unless new_sum.nil?
      @@data << { point: point, coords: coords, value: sum }
      point += 1
    end

    sum
  end

  class << self
    private

    def sum_adjacent_squares(coords)
      adjacent_squares(coords).
        map { |coords| @@data.find { |item| item[:coords] == coords } }.
        compact.
        map { |item| item[:value] }.
        reduce(&:+)
    end

    def adjacent_squares(coords)
      x, y = coords
      [
        [x, y + 1],     # north
        [x + 1, y + 1], # northeast
        [x + 1, y],     # east
        [x + 1, y - 1], # southeast
        [x, y - 1],     # south
        [x - 1, y - 1], # southwest
        [x - 1, y],     # west
        [x - 1, y + 1], # northwest
      ]
    end

    def spiral_coords_for(point)
      k= ( (Math.sqrt(point) - 1 ) / 2 ).ceil
      t= 2 * k + 1
      m= t**2
      t= t - 1

      if point >= m - t
        return [k - (m - point), -k]
      else
        m= m - t
      end

      if point >= m - t
        return [-k, -k + (m - point)]
      else
        m = m - t
      end

      if point >= m - t
        return [-k + (m - point), k]
      else
        return [k ,k - (m - point - t)]
      end
    end
  end
end
