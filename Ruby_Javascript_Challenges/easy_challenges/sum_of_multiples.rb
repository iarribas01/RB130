class SumOfMultiples
  DEFAULT_LIST = [3, 5]

  def initialize(*list)
    @list = list
  end

  def self.to(target)
    self.new(*DEFAULT_LIST).to(target)
  end

  def to(target)
    multiples(target).sum
  end

  private
  attr_reader :list

  def multiples(target)
    multiples = []
    list.each { |value| multiples += multiples_of(value, target) }
    multiples.flatten.uniq
  end

  def multiples_of(num, target)
    num.upto(target - 1).select {|n| n % num == 0}
  end
end