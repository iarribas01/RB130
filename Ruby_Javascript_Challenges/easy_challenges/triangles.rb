class Triangle 
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if isosceles?      then 'isoceles'
    elsif equilateral? then 'equilateral'
    else                    'scalene'
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
end

puts Triangle.new(2, 3, 1).kind