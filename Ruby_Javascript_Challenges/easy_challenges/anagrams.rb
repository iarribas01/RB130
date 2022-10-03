class Anagram
  def initialize(str)
    @str = str
  end

  def match(words)
    matches = []

    words.each do |word|
      matches << word if anagram?(word)
    end
    
    matches
  end

  private

  def anagram?(word)
    return false if word.length != str.length

    str.downcase.chars.each do |letter|
      if str.downcase.count(letter) != word.downcase.count(letter)
        return false
      end
    end

    return false if str.downcase == word.downcase

    true
  end

  attr_reader :str
end