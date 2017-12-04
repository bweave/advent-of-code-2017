require "byebug"
require "minitest/autorun"
require "minitest/pride"
require_relative "../day_4"

class Day4Test < Minitest::Test
  def passphrases
    @passpharses ||= ["aa bb cc dd ee"]
  end

  def subject
    HighEntropyPassphrases.new(passphrases)
  end

  def test_basic_assumptions
		assert 1, subject.valid_passphrase_count

		@passpharses = ["aa"]
		assert 0, subject.valid_passphrase_count

		@passpharses = ["aa bb cc dd aa"]
		assert 0, subject.valid_passphrase_count

		@passpharses = ["aa bb cc dd aaa"]
		assert 1, subject.valid_passphrase_count

		@passphrases = [
			"aa bb cc",
			"aa bb aa",
			"dd ee ff",
		]
		assert 2, subject.valid_passphrase_count
  end

  def test_puzzle_input
    skip
		lines = File.readlines("day_4_input.txt")
    puts HighEntropyPassphrases.new(lines).valid_passphrase_count
  end

  def test_part_2_basic_assumptions
    @passphrases = [
      "abc cba",
      "def jki",
    ]
    assert 1, subject.valid_anagramless_count
  end

  def test_part_2_puzzle_input
    skip
    lines = File.readlines("day_4_input.txt")
    puts HighEntropyPassphrases.new(lines).valid_anagramless_count
  end
end
