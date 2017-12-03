class InverseCaptcha
  def initialize(captcha)
    @captcha = captcha
  end

  def sum
    digits.each_with_index.reduce(0) do |sum, (int, i)|
      sum += int if int == digits[i+1]
      sum += int if (i == digits.size - 1) && (int == digits.first)
      sum
    end
  end

  def halfway_around_sum
    digits.each_with_index.reduce(0) do |sum, (int, i)|
      index = (i + digits.length/2) % digits.length
      sum += int if int == digits[index]
      sum
    end
  end

  private

  attr_reader :captcha, :digits

  def digits
    @digits ||= captcha.to_s.chars.map(&:to_i)
  end
end
