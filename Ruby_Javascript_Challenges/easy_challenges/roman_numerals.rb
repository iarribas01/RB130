class RomanNumeral
  attr_reader :value
  ROMAN_NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def initialize(value)
    @value = value
  end

  def to_roman
    temp = value
    roman_numeral_str = ""
    ROMAN_NUMERALS.each do |key, value|
      if key < temp
        digit = temp.digits.last
        roman_numeral_str << value * digit
        temp -= key
      end
    end

    roman_numeral_str
  end
end

puts RomanNumeral.new(14).to_roman

# 1000

