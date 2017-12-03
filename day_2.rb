class CorruptionChecksum
  def self.checksum(data)
    data.map { |row| row.max - row.min }.reduce(&:+)
  end

  def self.evenly_divisible_values(data)
    data.flat_map do |row|
      row.flat_map do |value|
        divisor = (row - [value]).find { |divisor| value % divisor == 0 }
        value / divisor unless divisor.nil?
      end.compact
    end.reduce(&:+)
  end
end
