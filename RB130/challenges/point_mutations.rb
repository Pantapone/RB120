## Hamming distance between two strands of DNA 
# -> counting the number of differences between two homologous DNA strands -> gives us the minimum number of point mutations

# Conditions
# - only defined for sequences of equal length -> if two sequences of unequal length, compute it over the shorter length

# - check which one is longer, original or second string
# - splice the longer string so that it has the same length as the shorter string -> only compare that one
# - split the string up into characters (char) and compare for each whether they are the same; if they are not, increment an instance variable count that you then return as your result


## first time solution

# class DNA
#   def initialize(dna)
#     @dna = dna
#   end

#   def hamming_distance(strand)
#     count = 0
#     @strand = strand
#     if @dna.size > @strand.size
#       @strand.chars.each_with_index do |base, index|
#         count += 1 if base != @dna[index]
#       end 
#     else
#       @dna.chars.each_with_index do |base, index|
#         count += 1 if base != @strand[index]
#       end
#     end
#     count
#   end
# end



## second try

class DNA
  attr_reader :dna_string

  def initialize(dna_string)
    @dna_string = dna_string
  end

  def hamming_distance(second_string)
    if @dna_string.size < second_string.size
      shorter = @dna_string
      longer = second_string
    else
      shorter = second_string
      longer = @dna_string
    end

    count_differences = 0
    shorter.chars.each_with_index do |base, index|
      count_differences += 1 if base != longer[index]
    end
    count_differences
  end
end