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
    CODON_TO_PROTEIN.fetch(codon) {fail InvalidCodonError}
  
  end

  def self.of_rna(strand)
    array = []
    counter = 0
    index = 2
    loop do
      break if index > strand.size 
      array << strand[counter..index]
      counter += 3
      index += 3 
    end
    
    array.take_while {|x| of_codon(x) != "STOP"}.map {|code| of_codon(code)}
  end
end