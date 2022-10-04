class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0
    if aliquot_sum(num) == num
      "perfect"
    elsif aliquot_sum(num) > num
      "abundant"
    else
      "deficient"
    end
  end

  def self.aliquot_sum(num)
    positive_divisors(num).sum
  end

  def self.positive_divisors(num)
    divisors = []
    1.upto(num/2).each do |n|
      if num % n == 0
        divisors << n
      end
    end
    divisors
  end

end

=begin 

aliquot_sum = sum of positive divisors

Abundant


Perfect

Deficient

=end