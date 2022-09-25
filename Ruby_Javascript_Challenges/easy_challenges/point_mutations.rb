class DNA

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    difference = 0

    comparison_strand = strand.chars.zip(other_strand.chars)
  
    comparison_strand.each do |first, second|
      break if first.nil? || second.nil?
      difference += 1 if first != second
    end
     
    difference
  end

  private attr_reader :strand

end
