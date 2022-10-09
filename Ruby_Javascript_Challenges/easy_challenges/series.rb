class Series 
  def initialize(str)
    @str = str

  end

  def slices(size)
    raise ArgumentError if size > str.size
    result = []

    0.upto(str.size - size) do |start_index|
      result << str[start_index, size].chars.map(&:to_i)
    end
   
    result
  end

  private

  attr_reader :str
end