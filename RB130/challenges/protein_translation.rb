CODON_TO_PROTEIN = {
  'AUG' => 'Methionine',
  "UUU" =>  "Phenylalanine",
  "UUC" =>  "Phenylalanine",
  "UUA" =>  "Leucine",
  "UUG" =>  "Leucine",
  "UCU" =>  "Serine",
  "UCC" =>  "Serine",
  "UCA" =>  "Serine",
  "UCG" => "Serine",
  "UAU" =>  "Tyrosine",
  "UAC" =>  "Tyrosine",
  "UGU" =>  "Cysteine",
  "UGC" => "Cysteine",
  "UGG" => "Tryptophan",
  "UAA" =>  "STOP",
  "UAG" =>  "STOP",
  "UGA" =>  "STOP"
}



class Translation
  def self.of_codon(codon)
    CODON_TO_PROTEIN[codon]
  
  end

  def self.of_rna(strand)
    keys = CODON_TO_PROTEIN.keys
    raise InvalidCodonError if keys.each {|key| !strand.include?(key)}
    
    array = []
    counter = 0
    index = 2
    loop do
      break if index > strand.size 
      array << strand[counter..index]
      counter += 3
      index += 3 
    end


    array.take_while {|x| CODON_TO_PROTEIN[x] != "STOP"}.map do |letter|
      CODON_TO_PROTEIN[letter]
    end
  end
end