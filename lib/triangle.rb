class Triangle
  attr_reader :length1, :length2, :length3

  def initialize (length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    raise TriangleError unless [length1, length2, length3].all?{|x| x > 0} && triangle_equality_valid
    if length1 == length2 && length2 == length3
      :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
      :isosceles
    else
      :scalene
    end
  end

  def triangle_equality_valid
    length1 + length2 > length3 && length2 + length3 > length1 && length1 + length3 > length2
  end

  class TriangleError < StandardError
    def message
      "this isn't a valid triangle"
    end
  end
end
