class InvalidTriangleError < StandardError; end

class Triangle 
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError if !valid?
    # raise InvalidTriangleError if !valid?
  end

  def kind
    if    !valid?      then 'invalid'
    elsif isosceles?   then 'isosceles'
    elsif equilateral? then 'equilateral'
    elsif scalene?     then 'scalene'
    end
  end

  def sides
    [@side1, @side2, @side3]
  end

  def equilateral?
    sides.all? {|s| s == @side1}
  end

  def isosceles?
    sides.count(@side1) == 2 ||
    sides.count(@side2) == 2 
  end

  def scalene?
    sides.uniq.size == 3
  end

  def valid?
    return false if sides.any?{|s| s <= 0}
    
    return false if (
      @side1 + @side2 <= @side3 ||
      @side2 + @side3 <= @side1 ||
      @side1 + @side3 <= @side2
    )

    true
  end
end

# puts Triangle.new(0, 0, 0).kind