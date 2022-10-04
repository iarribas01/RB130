class Scrabble
  def initialize(str)
    @str = str
  end

  def self.score(string)
    self.new(string).score
  end

  def score
    return 0 if !valid?
    total = ( 0 + 
      score_for(/[AEIOULNRST]/i, 1) +
      score_for(/[DG]/i, 2) +
      score_for(/[BCMP]/i, 3) +
      score_for(/[FHVWY]/i, 4) +
      score_for(/[K]/i, 5) +
      score_for(/[JX]/i, 8) +
      score_for(/[QZ]/i, 10)
    )
  end

  def valid?
    str.class == String
  end

  private

  attr_reader :str

  def score_for(category, multiplier)
    ( str.size - str.gsub(category, "").size ) * multiplier
  end
end