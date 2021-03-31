class Phrase
  attr_reader :words

  def initialize(word)
    @words = word.gsub(/[^a-zA-Z\s]/, "").downcase
  end

  def word_count
    hash = Hash.new(0)

    self.words.split.each do |word|
      hash[word] += 1
    end
    hash

  end


end
