class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if invalid?

    decimal = 0
    digits = octal.chars.map(&:to_i).reverse

    digits.each_with_index do |n, i|
      decimal += (n * (8**i))
    end
    
    decimal
  end

  private

  attr_reader :octal

  def invalid?
    !!(octal =~ /[^(0-7)]/)
  end

end

# Octal.new('2047').to_decimal
