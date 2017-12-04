require "awesome_print"

class HighEntropyPassphrases
  def initialize(passphrases)
    @passphrases = passphrases
  end

  def valid_passphrase_count
    passphrases.select do |passphrase|
      valid?(passphrase)
    end.count
  end

  def valid_anagramless_count
    passphrases.select do |passphrase|
      valid?(passphrase) && anagramless?(passphrase)
    end.count
  end

  private

  attr_reader :passphrases

  def valid?(passphrase)
    words = passphrase.strip.split
    if words.count < 2 || duplicate_words?(words)
      false
    else
      true
    end
  end

  def duplicate_words?(words)
    dupes = words.each_with_index.map do |word, i|
      possible_dupes = words.slice(i+1..words.length)
      possible_dupes.any? { |possible_dupe| possible_dupe == word }
    end.any?
  end

  def anagramless?(passphrase)
    words = passphrase.strip.split
    words.map { |word| word.chars.sort.join }.uniq.length == words.length
  end
end
