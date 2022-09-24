class InvalidTriangleError < StandardError; end

class Triangle 
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise InvalidTriangleError if !valid?
  end

  def kind
    if    !valid?      then 'invalid'
    elsif isosceles?   then 'isoceles'
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
    
    return true unless sides.any?{|s| s <= 0}
    
    unless (sides[1, 2].sum < sides[0] ||
            sides[0, 2].sum < sides[1] ||
            sides[0, 1].sum < sides[2] )
              return true
    end

    false
  end
end

puts Triangle.new(2, 3, 1).kind