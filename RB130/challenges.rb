###- Easy
###-------------------------------------------------------------------------------------------------------------------

   # - Triangles
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require_relative 'triangles'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2
    assert_raises(ArgumentError) do
      triangle = Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 1, 3)
    end
  end
end

#Solution
#--------------------------------------

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] >= sides[2] &&
    sides[1] + sides[2] >= sides[0] &&
    sides[0] + sides[2] >= sides[1]
  end
end


   # - Point Mutations
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require_relative 'point_mutations'

class DNATest < Minitest::Test
  def test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
  end

  def test_no_difference_between_identical_strands
    skip
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
  end

  def test_complete_hamming_distance_in_small_strand
    skip
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')
  end

  def test_hamming_distance_in_off_by_one_strand
    skip
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand).hamming_distance(distance)
  end

  def test_small_hamming_distance_in_middle_somewhere
    skip
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
  end

  def test_larger_distance
    skip
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
    skip
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
  end

  def test_ignores_extra_length_on_original_strand_when_longer
    skip
    strand = 'GACTACGGACAGGGTAGGGAAT'
    distance = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand).hamming_distance(distance)
  end

  def test_does_not_actually_shorten_original_strand
    skip
    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')
  end
end

#Solution
#--------------------------------------

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    shorter = @strand.length < comparison.length ? @strand : comparison
    differences = 0

    shorter.length.times do |index|
      differences += 1 unless @strand[index] == comparison[index]
    end

    differences
  end
end

   # - Roman Numerals
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    number = RomanNumeral.new(1)
    assert_equal 'I', number.to_roman
  end

  def test_2
    number = RomanNumeral.new(2)
    assert_equal 'II', number.to_roman
  end

  def test_3
    number = RomanNumeral.new(3)
    assert_equal 'III', number.to_roman
  end

  def test_4
    number = RomanNumeral.new(4)
    assert_equal 'IV', number.to_roman
  end

  def test_5
    number = RomanNumeral.new(5)
    assert_equal 'V', number.to_roman
  end

  def test_6
    number = RomanNumeral.new(6)
    assert_equal 'VI', number.to_roman
  end

  def test_9
    number = RomanNumeral.new(9)
    assert_equal 'IX', number.to_roman
  end

  def test_27
    number = RomanNumeral.new(27)
    assert_equal 'XXVII', number.to_roman
  end

  def test_48
    number = RomanNumeral.new(48)
    assert_equal 'XLVIII', number.to_roman
  end

  def test_59
    number = RomanNumeral.new(59)
    assert_equal 'LIX', number.to_roman
  end

  def test_93
    number = RomanNumeral.new(93)
    assert_equal 'XCIII', number.to_roman
  end

  def test_141
    number = RomanNumeral.new(141)
    assert_equal 'CXLI', number.to_roman
  end

  def test_163
    number = RomanNumeral.new(163)
    assert_equal 'CLXIII', number.to_roman
  end

  def test_402
    number = RomanNumeral.new(402)
    assert_equal 'CDII', number.to_roman
  end

  def test_575
    number = RomanNumeral.new(575)
    assert_equal 'DLXXV', number.to_roman
  end

  def test_911
    number = RomanNumeral.new(911)
    assert_equal 'CMXI', number.to_roman
  end

  def test_1024
    number = RomanNumeral.new(1024)
    assert_equal 'MXXIV', number.to_roman
  end

  def test_3000
    number = RomanNumeral.new(3000)
    assert_equal 'MMM', number.to_roman
  end
end


#Solution
#--------------------------------------

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

   # - Anagrams
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants))
  end

  def test_detect_simple_anagram
    skip
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams
  end

  def test_detect_multiple_anagrams
    skip
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
  end

  def test_does_not_confuse_different_duplicates
    skip
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle'])
  end

  def test_identical_word_is_not_anagram
    skip
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
    skip
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last'])
  end

  def test_eliminate_anagram_subsets
    skip
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))
  end

  def test_detect_anagram
    skip
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana)
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
    skip
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort
  end

  def test_anagrams_are_case_insensitive
    skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams
  end
end


#Solution
#--------------------------------------

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end

   # - Scrabble Score
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end


#Solution
#--------------------------------------

class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |all_letters, point|
        total += point if all_letters.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

   # - Perfect Number
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end

#Solution
#--------------------------------------

class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select do |possible_divisor|
        number % possible_divisor == 0
      end.sum
    end
  end
end

   # - Octal
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'octal'

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    skip
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    skip
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    skip
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
    skip
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
    skip
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
    skip
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
    skip
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    skip
    assert_equal 0, Octal.new('carrot').to_decimal
  end

  def test_8_is_seen_as_invalid_and_returns_0
    skip
    assert_equal 0, Octal.new('8').to_decimal
  end

  def test_9_is_seen_as_invalid_and_returns_0
    skip
    assert_equal 0, Octal.new('9').to_decimal
  end

  def test_6789_is_seen_as_invalid_and_returns_0
    skip
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
    skip
    assert_equal 0, Octal.new('abc1z').to_decimal
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
    skip
    assert_equal 9, Octal.new('011').to_decimal
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
    skip
    assert_equal 0, Octal.new('234abc').to_decimal
  end
end



#Solution
#--------------------------------------

class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)

    arr_digits = number.to_i.digits

    new_number = 0
    arr_digits.each_with_index do |num, exponent|
      new_number += (num * (8 ** exponent))
    end

    new_number
  end

  private

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end

   # - Sum of Multiples
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require_relative 'sum_of_multiples'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    skip
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    skip
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    skip
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    skip
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    skip
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end

#Solution
#--------------------------------------

class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end 

   # - Beer Song
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'beer_song'

# rubocop:disable Metrics/LineLength
class BeerSongTest < Minitest::Test
  def test_the_first_verse
    expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(99)
  end

  def test_another_verse
    expected = "3 bottles of beer on the wall, 3 bottles of beer.\n" \
      "Take one down and pass it around, 2 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(3)
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(2)
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(1)
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(0)
  end

  def test_a_couple_verses
    expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
      "\n" \
      "98 bottles of beer on the wall, 98 bottles of beer.\n" \
      "Take one down and pass it around, 97 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verses(99, 98)
  end

  def test_a_few_verses
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
      "\n" \
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
      "\n" \
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verses(2, 0)
  end

    def test_the_whole_song # rubocop:disable Metrics/MethodLength
    expected = <<-SONG
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.

97 bottles of beer on the wall, 97 bottles of beer.
Take one down and pass it around, 96 bottles of beer on the wall.

96 bottles of beer on the wall, 96 bottles of beer.
Take one down and pass it around, 95 bottles of beer on the wall.

95 bottles of beer on the wall, 95 bottles of beer.
Take one down and pass it around, 94 bottles of beer on the wall.

94 bottles of beer on the wall, 94 bottles of beer.
Take one down and pass it around, 93 bottles of beer on the wall.

93 bottles of beer on the wall, 93 bottles of beer.
Take one down and pass it around, 92 bottles of beer on the wall.

92 bottles of beer on the wall, 92 bottles of beer.
Take one down and pass it around, 91 bottles of beer on the wall.

91 bottles of beer on the wall, 91 bottles of beer.
Take one down and pass it around, 90 bottles of beer on the wall.

90 bottles of beer on the wall, 90 bottles of beer.
Take one down and pass it around, 89 bottles of beer on the wall.

89 bottles of beer on the wall, 89 bottles of beer.
Take one down and pass it around, 88 bottles of beer on the wall.

88 bottles of beer on the wall, 88 bottles of beer.
Take one down and pass it around, 87 bottles of beer on the wall.

87 bottles of beer on the wall, 87 bottles of beer.
Take one down and pass it around, 86 bottles of beer on the wall.

86 bottles of beer on the wall, 86 bottles of beer.
Take one down and pass it around, 85 bottles of beer on the wall.

85 bottles of beer on the wall, 85 bottles of beer.
Take one down and pass it around, 84 bottles of beer on the wall.

84 bottles of beer on the wall, 84 bottles of beer.
Take one down and pass it around, 83 bottles of beer on the wall.

83 bottles of beer on the wall, 83 bottles of beer.
Take one down and pass it around, 82 bottles of beer on the wall.

82 bottles of beer on the wall, 82 bottles of beer.
Take one down and pass it around, 81 bottles of beer on the wall.

81 bottles of beer on the wall, 81 bottles of beer.
Take one down and pass it around, 80 bottles of beer on the wall.

80 bottles of beer on the wall, 80 bottles of beer.
Take one down and pass it around, 79 bottles of beer on the wall.

79 bottles of beer on the wall, 79 bottles of beer.
Take one down and pass it around, 78 bottles of beer on the wall.

78 bottles of beer on the wall, 78 bottles of beer.
Take one down and pass it around, 77 bottles of beer on the wall.

77 bottles of beer on the wall, 77 bottles of beer.
Take one down and pass it around, 76 bottles of beer on the wall.

76 bottles of beer on the wall, 76 bottles of beer.
Take one down and pass it around, 75 bottles of beer on the wall.

75 bottles of beer on the wall, 75 bottles of beer.
Take one down and pass it around, 74 bottles of beer on the wall.

74 bottles of beer on the wall, 74 bottles of beer.
Take one down and pass it around, 73 bottles of beer on the wall.

73 bottles of beer on the wall, 73 bottles of beer.
Take one down and pass it around, 72 bottles of beer on the wall.

72 bottles of beer on the wall, 72 bottles of beer.
Take one down and pass it around, 71 bottles of beer on the wall.

71 bottles of beer on the wall, 71 bottles of beer.
Take one down and pass it around, 70 bottles of beer on the wall.

70 bottles of beer on the wall, 70 bottles of beer.
Take one down and pass it around, 69 bottles of beer on the wall.

69 bottles of beer on the wall, 69 bottles of beer.
Take one down and pass it around, 68 bottles of beer on the wall.

68 bottles of beer on the wall, 68 bottles of beer.
Take one down and pass it around, 67 bottles of beer on the wall.

67 bottles of beer on the wall, 67 bottles of beer.
Take one down and pass it around, 66 bottles of beer on the wall.

66 bottles of beer on the wall, 66 bottles of beer.
Take one down and pass it around, 65 bottles of beer on the wall.

65 bottles of beer on the wall, 65 bottles of beer.
Take one down and pass it around, 64 bottles of beer on the wall.

64 bottles of beer on the wall, 64 bottles of beer.
Take one down and pass it around, 63 bottles of beer on the wall.

63 bottles of beer on the wall, 63 bottles of beer.
Take one down and pass it around, 62 bottles of beer on the wall.

62 bottles of beer on the wall, 62 bottles of beer.
Take one down and pass it around, 61 bottles of beer on the wall.

61 bottles of beer on the wall, 61 bottles of beer.
Take one down and pass it around, 60 bottles of beer on the wall.

60 bottles of beer on the wall, 60 bottles of beer.
Take one down and pass it around, 59 bottles of beer on the wall.

59 bottles of beer on the wall, 59 bottles of beer.
Take one down and pass it around, 58 bottles of beer on the wall.

58 bottles of beer on the wall, 58 bottles of beer.
Take one down and pass it around, 57 bottles of beer on the wall.

57 bottles of beer on the wall, 57 bottles of beer.
Take one down and pass it around, 56 bottles of beer on the wall.

56 bottles of beer on the wall, 56 bottles of beer.
Take one down and pass it around, 55 bottles of beer on the wall.

55 bottles of beer on the wall, 55 bottles of beer.
Take one down and pass it around, 54 bottles of beer on the wall.

54 bottles of beer on the wall, 54 bottles of beer.
Take one down and pass it around, 53 bottles of beer on the wall.

53 bottles of beer on the wall, 53 bottles of beer.
Take one down and pass it around, 52 bottles of beer on the wall.

52 bottles of beer on the wall, 52 bottles of beer.
Take one down and pass it around, 51 bottles of beer on the wall.

51 bottles of beer on the wall, 51 bottles of beer.
Take one down and pass it around, 50 bottles of beer on the wall.

50 bottles of beer on the wall, 50 bottles of beer.
Take one down and pass it around, 49 bottles of beer on the wall.

49 bottles of beer on the wall, 49 bottles of beer.
Take one down and pass it around, 48 bottles of beer on the wall.

48 bottles of beer on the wall, 48 bottles of beer.
Take one down and pass it around, 47 bottles of beer on the wall.

47 bottles of beer on the wall, 47 bottles of beer.
Take one down and pass it around, 46 bottles of beer on the wall.

46 bottles of beer on the wall, 46 bottles of beer.
Take one down and pass it around, 45 bottles of beer on the wall.

45 bottles of beer on the wall, 45 bottles of beer.
Take one down and pass it around, 44 bottles of beer on the wall.

44 bottles of beer on the wall, 44 bottles of beer.
Take one down and pass it around, 43 bottles of beer on the wall.

43 bottles of beer on the wall, 43 bottles of beer.
Take one down and pass it around, 42 bottles of beer on the wall.

42 bottles of beer on the wall, 42 bottles of beer.
Take one down and pass it around, 41 bottles of beer on the wall.

41 bottles of beer on the wall, 41 bottles of beer.
Take one down and pass it around, 40 bottles of beer on the wall.

40 bottles of beer on the wall, 40 bottles of beer.
Take one down and pass it around, 39 bottles of beer on the wall.

39 bottles of beer on the wall, 39 bottles of beer.
Take one down and pass it around, 38 bottles of beer on the wall.

38 bottles of beer on the wall, 38 bottles of beer.
Take one down and pass it around, 37 bottles of beer on the wall.

37 bottles of beer on the wall, 37 bottles of beer.
Take one down and pass it around, 36 bottles of beer on the wall.

36 bottles of beer on the wall, 36 bottles of beer.
Take one down and pass it around, 35 bottles of beer on the wall.

35 bottles of beer on the wall, 35 bottles of beer.
Take one down and pass it around, 34 bottles of beer on the wall.

34 bottles of beer on the wall, 34 bottles of beer.
Take one down and pass it around, 33 bottles of beer on the wall.

33 bottles of beer on the wall, 33 bottles of beer.
Take one down and pass it around, 32 bottles of beer on the wall.

32 bottles of beer on the wall, 32 bottles of beer.
Take one down and pass it around, 31 bottles of beer on the wall.

31 bottles of beer on the wall, 31 bottles of beer.
Take one down and pass it around, 30 bottles of beer on the wall.

30 bottles of beer on the wall, 30 bottles of beer.
Take one down and pass it around, 29 bottles of beer on the wall.

29 bottles of beer on the wall, 29 bottles of beer.
Take one down and pass it around, 28 bottles of beer on the wall.

28 bottles of beer on the wall, 28 bottles of beer.
Take one down and pass it around, 27 bottles of beer on the wall.

27 bottles of beer on the wall, 27 bottles of beer.
Take one down and pass it around, 26 bottles of beer on the wall.

26 bottles of beer on the wall, 26 bottles of beer.
Take one down and pass it around, 25 bottles of beer on the wall.

25 bottles of beer on the wall, 25 bottles of beer.
Take one down and pass it around, 24 bottles of beer on the wall.

24 bottles of beer on the wall, 24 bottles of beer.
Take one down and pass it around, 23 bottles of beer on the wall.

23 bottles of beer on the wall, 23 bottles of beer.
Take one down and pass it around, 22 bottles of beer on the wall.

22 bottles of beer on the wall, 22 bottles of beer.
Take one down and pass it around, 21 bottles of beer on the wall.

21 bottles of beer on the wall, 21 bottles of beer.
Take one down and pass it around, 20 bottles of beer on the wall.

20 bottles of beer on the wall, 20 bottles of beer.
Take one down and pass it around, 19 bottles of beer on the wall.

19 bottles of beer on the wall, 19 bottles of beer.
Take one down and pass it around, 18 bottles of beer on the wall.

18 bottles of beer on the wall, 18 bottles of beer.
Take one down and pass it around, 17 bottles of beer on the wall.

17 bottles of beer on the wall, 17 bottles of beer.
Take one down and pass it around, 16 bottles of beer on the wall.

16 bottles of beer on the wall, 16 bottles of beer.
Take one down and pass it around, 15 bottles of beer on the wall.

15 bottles of beer on the wall, 15 bottles of beer.
Take one down and pass it around, 14 bottles of beer on the wall.

14 bottles of beer on the wall, 14 bottles of beer.
Take one down and pass it around, 13 bottles of beer on the wall.

13 bottles of beer on the wall, 13 bottles of beer.
Take one down and pass it around, 12 bottles of beer on the wall.

12 bottles of beer on the wall, 12 bottles of beer.
Take one down and pass it around, 11 bottles of beer on the wall.

11 bottles of beer on the wall, 11 bottles of beer.
Take one down and pass it around, 10 bottles of beer on the wall.

10 bottles of beer on the wall, 10 bottles of beer.
Take one down and pass it around, 9 bottles of beer on the wall.

9 bottles of beer on the wall, 9 bottles of beer.
Take one down and pass it around, 8 bottles of beer on the wall.

8 bottles of beer on the wall, 8 bottles of beer.
Take one down and pass it around, 7 bottles of beer on the wall.

7 bottles of beer on the wall, 7 bottles of beer.
Take one down and pass it around, 6 bottles of beer on the wall.

6 bottles of beer on the wall, 6 bottles of beer.
Take one down and pass it around, 5 bottles of beer on the wall.

5 bottles of beer on the wall, 5 bottles of beer.
Take one down and pass it around, 4 bottles of beer on the wall.

4 bottles of beer on the wall, 4 bottles of beer.
Take one down and pass it around, 3 bottles of beer on the wall.

3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    SONG
    assert_equal expected, BeerSong.lyrics
  end
end


#Solution
#--------------------------------------
class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end


   # - Series
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'series'

class SeriesTest < Minitest::Test
  def test_simple_slices_of_one
    series = Series.new('01234')
    assert_equal [[0], [1], [2], [3], [4]], series.slices(1)
  end

  def test_simple_slices_of_one_again
    skip
    series = Series.new('92834')
    assert_equal [[9], [2], [8], [3], [4]], series.slices(1)
  end

  def test_simple_slices_of_two
    skip
    series = Series.new('01234')
    assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)
  end

  def test_other_slices_of_two
    skip
    series = Series.new('98273463')
    expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
    assert_equal expected, series.slices(2)
  end

  def test_simple_slices_of_two_again
    skip
    series = Series.new('37103')
    assert_equal [[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2)
  end

  def test_simple_slices_of_three
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3)
  end

  def test_simple_slices_of_three_again
    skip
    series = Series.new('31001')
    assert_equal [[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3)
  end

  def test_other_slices_of_three
    skip
    series = Series.new('982347')
    expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
    assert_equal expected, series.slices(3)
  end

  def test_simple_slices_of_four
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4)
  end

  def test_simple_slices_of_four_again
    skip
    series = Series.new('91274')
    assert_equal [[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4)
  end

  def test_simple_slices_of_five
    skip
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3, 4]], series.slices(5)
  end

  def test_simple_slices_of_five_again
    skip
    series = Series.new('81228')
    assert_equal [[8, 1, 2, 2, 8]], series.slices(5)
  end

  def test_simple_slice_that_blows_up
    skip
    series = Series.new('01234')
    assert_raises ArgumentError do
      series.slices(6)
    end
  end

  def test_more_complicated_slice_that_blows_up
    skip
    slice_string = '01032987583'

    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(slice_string.length + 1)
    end
  end
end


#Solution
#--------------------------------------

class Series
  attr_accessor :str

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end


###- Medium
###-------------------------------------------------------------------------------------------------------------------
   # - Diamond
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require_relative '10_diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end


#Solution
#--------------------------------------

class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  private

  def self.make_row(letter)
    return "A" if letter == 'A'
    return "B B" if letter == 'B'

    letter + determine_spaces(letter) + letter
  end

  def self.determine_spaces(letter)
    all_letters = ['B']
    spaces = 1

    until all_letters.include?(letter)
      current_letter = all_letters.last
      all_letters << current_letter.next
      spaces += 2
    end

    ' ' * spaces
  end

  def self.max_width(letter)
    return 1 if letter == 'A'

    determine_spaces(letter).count(' ') + 2
  end
end

   # - Robot Name
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    skip
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    skip
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end

#Solution
#--------------------------------------

class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ''
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end

   # - Clock
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'clock'

class ClockTest < Minitest::Test
  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    skip
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_subtract_fifty_minutes
    skip
    clock = Clock.at(0) - 50
    assert_equal '23:10', clock.to_s
  end

  def test_add_over_an_hour
    skip
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    skip
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_add_more_than_a_day
    skip
    clock = Clock.at(10) + 3061
    assert_equal '13:01', clock.to_s
  end

  def test_subtract_a_few_minutes
    skip
    clock = Clock.at(10, 30) - 5
    assert_equal '10:25', clock.to_s
  end

  def test_subtract_minutes
    skip
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_wrap_around_at_negative_midnight
    skip
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end

  def test_subtract_more_than_a_day
    skip
    clock = Clock.at(10) - 3061
    assert_equal '06:59', clock.to_s
  end

  def test_equivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    skip
    clock1 = Clock.at(0, 30) - 60
    clock2 = Clock.at(23, 30)
    assert_equal clock1, clock2
  end
end
#Solution
#--------------------------------------

class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0>
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end

   # - Meetups
   # Instructions & Test Cases
#--------------------------------------
require 'minitest/autorun'
require 'date'
require_relative 'meetup'

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.

class MeetupTest < Minitest::Test
  def test_first_monday_of_march_2013
    meetup = Meetup.new(2013, 3)
    assert_equal Date.civil(2013, 3, 4), meetup.day('Monday', 'first')
  end

  def test_first_monday_of_april_2013
    skip
    meetup = Meetup.new(2013, 4)
    assert_equal Date.civil(2013, 4, 1), meetup.day('monday', 'FIRST')
  end

  def test_first_tuesday_of_may_2013
    skip
    meetup = Meetup.new(2013, 5)
    assert_equal Date.civil(2013, 5, 7), meetup.day('Tuesday', 'first')
  end

  def test_first_wednesday_of_june_2013
    skip
    meetup = Meetup.new(2013, 6)
    assert_equal Date.civil(2013, 6, 5), meetup.day('wednesday', 'first')
  end

  def test_first_thursday_of_july_2013
    skip
    meetup = Meetup.new(2013, 7)
    assert_equal Date.civil(2013, 7, 4), meetup.day('Thursday', 'first')
  end

  def test_first_friday_of_august_2013
    skip
    meetup = Meetup.new(2013, 8)
    assert_equal Date.civil(2013, 8, 2), meetup.day('Friday', 'first')
  end

  def test_first_saturday_of_september_2013
    skip
    meetup = Meetup.new(2013, 9)
    assert_equal Date.civil(2013, 9, 7), meetup.day('Saturday', 'first')
  end

  def test_first_sunday_of_october_2013
    skip
    meetup = Meetup.new(2013, 10)
    assert_equal Date.civil(2013, 10, 6), meetup.day('Sunday', 'first')
  end

  def test_second_monday_of_november_2013
    skip
    meetup = Meetup.new(2013, 11)
    assert_equal Date.civil(2013, 11, 11), meetup.day('Monday', 'second')
  end

  def test_second_tuesday_of_december_2013
    skip
    meetup = Meetup.new(2013, 12)
    assert_equal Date.civil(2013, 12, 10), meetup.day('Tuesday', 'second')
  end

  def test_second_wednesday_of_january_2014
    skip
    meetup = Meetup.new(2014, 1)
    assert_equal Date.civil(2014, 1, 8), meetup.day('Wednesday', 'second')
  end

  def test_second_thursday_of_february_2014
    skip
    meetup = Meetup.new(2014, 2)
    assert_equal Date.civil(2014, 2, 13), meetup.day('Thursday', 'second')
  end

  def test_second_friday_of_march_2014
    skip
    meetup = Meetup.new(2014, 3)
    assert_equal Date.civil(2014, 3, 14), meetup.day('Friday', 'second')
  end

  def test_second_saturday_of_april_2014
    skip
    meetup = Meetup.new(2014, 4)
    assert_equal Date.civil(2014, 4, 12), meetup.day('Saturday', 'second')
  end

  def test_second_sunday_of_may_2014
    skip
    meetup = Meetup.new(2014, 5)
    assert_equal Date.civil(2014, 5, 11), meetup.day('Sunday', 'second')
  end

  def test_third_monday_of_june_2014
    skip
    meetup = Meetup.new(2014, 6)
    assert_equal Date.civil(2014, 6, 16), meetup.day('Monday', 'third')
  end

  def test_third_tuesday_of_july_2014
    skip
    meetup = Meetup.new(2014, 7)
    assert_equal Date.civil(2014, 7, 15), meetup.day('Tuesday', 'third')
  end

  def test_third_wednesday_of_august_2014
    skip
    meetup = Meetup.new(2014, 8)
    assert_equal Date.civil(2014, 8, 20), meetup.day('Wednesday', 'third')
  end

  def test_third_thursday_of_september_2014
    skip
    meetup = Meetup.new(2014, 9)
    assert_equal Date.civil(2014, 9, 18), meetup.day('Thursday', 'third')
  end

  def test_third_friday_of_october_2014
    skip
    meetup = Meetup.new(2014, 10)
    assert_equal Date.civil(2014, 10, 17), meetup.day('Friday', 'third')
  end

  def test_third_saturday_of_november_2014
    skip
    meetup = Meetup.new(2014, 11)
    assert_equal Date.civil(2014, 11, 15), meetup.day('Saturday', 'third')
  end

  def test_third_sunday_of_december_2014
    skip
    meetup = Meetup.new(2014, 12)
    assert_equal Date.civil(2014, 12, 21), meetup.day('Sunday', 'third')
  end

  def test_fourth_monday_of_january_2015
    skip
    meetup = Meetup.new(2015, 1)
    assert_equal Date.civil(2015, 1, 26), meetup.day('Monday', 'fourth')
  end

  def test_fourth_tuesday_of_february_2015
    skip
    meetup = Meetup.new(2015, 2)
    assert_equal Date.civil(2015, 2, 24), meetup.day('Tuesday', 'fourth')
  end

  def test_fourth_wednesday_of_march_2015
    skip
    meetup = Meetup.new(2015, 3)
    assert_equal Date.civil(2015, 3, 25), meetup.day('Wednesday', 'fourth')
  end

  def test_fourth_thursday_of_april_2015
    skip
    meetup = Meetup.new(2015, 4)
    assert_equal Date.civil(2015, 4, 23), meetup.day('Thursday', 'fourth')
  end

  def test_fourth_friday_of_may_2015
    skip
    meetup = Meetup.new(2015, 5)
    assert_equal Date.civil(2015, 5, 22), meetup.day('Friday', 'fourth')
  end

  def test_fourth_saturday_of_june_2015
    skip
    meetup = Meetup.new(2015, 6)
    assert_equal Date.civil(2015, 6, 27), meetup.day('Saturday', 'fourth')
  end

  def test_fourth_sunday_of_july_2015
    skip
    meetup = Meetup.new(2015, 7)
    assert_equal Date.civil(2015, 7, 26), meetup.day('Sunday', 'fourth')
  end

  def test_fifth_monday_of_august_2015
    skip
    meetup = Meetup.new(2015, 8)
    assert_equal Date.civil(2015, 8, 31), meetup.day('Monday', 'fifth')
  end

  def test_fifth_tuesday_of_september_2015
    skip
    meetup = Meetup.new(2015, 9)
    assert_equal Date.civil(2015, 9, 29), meetup.day('Tuesday', 'fifth')
  end

  def test_fifth_wednesday_of_october_2015
    skip
    meetup = Meetup.new(2015, 10)
    assert_nil meetup.day('Wednesday', 'fifth')
  end

  def test_fifth_thursday_of_november_2015
    skip
    meetup = Meetup.new(2015, 11)
    assert_nil meetup.day('Thursday', 'fifth')
  end

  def test_fifth_friday_of_december_2015
    skip
    meetup = Meetup.new(2015, 12)
    assert_nil meetup.day('Friday', 'fifth')
  end

  def test_fifth_saturday_of_january_2016
    skip
    meetup = Meetup.new(2016, 1)
    assert_equal Date.civil(2016, 1, 30), meetup.day('Saturday', 'fifth')
  end

  def test_fifth_sunday_of_february_2016
    skip
    meetup = Meetup.new(2016, 2)
    assert_nil meetup.day('Sunday', 'fifth')
  end

  def test_fifth_monday_of_february_2016
    skip
    meetup = Meetup.new(2016, 2)
    assert_equal Date.civil(2016, 2, 29), meetup.day('Monday', 'fifth')
  end

  def test_last_monday_of_march_2016
    skip
    meetup = Meetup.new(2016, 3)
    assert_equal Date.civil(2016, 3, 28), meetup.day('Monday', 'last')
  end

  def test_last_tuesday_of_april_2016
    skip
    meetup = Meetup.new(2016, 4)
    assert_equal Date.civil(2016, 4, 26), meetup.day('Tuesday', 'last')
  end

  def test_last_wednesday_of_may_2016
    skip
    meetup = Meetup.new(2016, 5)
    assert_equal Date.civil(2016, 5, 25), meetup.day('Wednesday', 'last')
  end

  def test_last_thursday_of_june_2016
    skip
    meetup = Meetup.new(2016, 6)
    assert_equal Date.civil(2016, 6, 30), meetup.day('Thursday', 'last')
  end

  def test_last_friday_of_july_2016
    skip
    meetup = Meetup.new(2016, 7)
    assert_equal Date.civil(2016, 7, 29), meetup.day('Friday', 'last')
  end

  def test_last_saturday_of_august_2016
    skip
    meetup = Meetup.new(2016, 8)
    assert_equal Date.civil(2016, 8, 27), meetup.day('Saturday', 'last')
  end

  def test_last_sunday_of_september_2016
    skip
    meetup = Meetup.new(2016, 9)
    assert_equal Date.civil(2016, 9, 25), meetup.day('Sunday', 'last')
  end

  def test_last_sunday_of_february_2015
    skip
    meetup = Meetup.new(2015, 2)
    assert_equal Date.civil(2015, 2, 22), meetup.day('Sunday', 'last')
  end

  def test_teenth_monday_of_october_2016
    skip
    meetup = Meetup.new(2016, 10)
    assert_equal Date.civil(2016, 10, 17), meetup.day('Monday', 'teenth')
  end

  def test_teenth_tuesday_of_november_2016
    skip
    meetup = Meetup.new(2016, 11)
    assert_equal Date.civil(2016, 11, 15), meetup.day('Tuesday', 'teenth')
  end

  def test_teenth_wednesday_of_december_2016
    skip
    meetup = Meetup.new(2016, 12)
    assert_equal Date.civil(2016, 12, 14), meetup.day('Wednesday', 'teenth')
  end

  def test_teenth_thursday_of_january_2017
    skip
    meetup = Meetup.new(2017, 1)
    assert_equal Date.civil(2017, 1, 19), meetup.day('Thursday', 'teenth')
  end

  def test_teenth_friday_of_february_2017
    skip
    meetup = Meetup.new(2017, 2)
    assert_equal Date.civil(2017, 2, 17), meetup.day('Friday', 'teenth')
  end

  def test_teenth_saturday_of_march_2017
    skip
    meetup = Meetup.new(2017, 3)
    assert_equal Date.civil(2017, 3, 18), meetup.day('Saturday', 'teenth')
  end

  def test_teenth_sunday_of_april_2017
    skip
    meetup = Meetup.new(2017, 4)
    assert_equal Date.civil(2017, 4, 16), meetup.day('Sunday', 'teenth')
  end
end

#Solution
#--------------------------------------

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end

   # - Simple Linked List
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'

require_relative 'simple_linked_list'

class LinkedListTest < Minitest::Test
  def test_element_datum
    element = Element.new(1)
    assert_equal 1, element.datum
  end

  def test_element_tail
    skip
    element = Element.new(1)
    assert element.tail?
  end

  def test_element_next_default
    skip
    element = Element.new(1)
    assert_nil element.next
  end

  def test_element_next_initialization
    skip
    element1 = Element.new(1)
    element2 = Element.new(2, element1)
    assert_equal element1, element2.next
  end

  def test_empty_list_size
    skip
    list = SimpleLinkedList.new
    assert_equal 0, list.size
  end

  def test_empty_list_empty
    skip
    list = SimpleLinkedList.new
    assert list.empty?
  end

  def test_pushing_element_on_list
    skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
  end

  def test_empty_list_1_element
    skip
    list = SimpleLinkedList.new
    list.push(1)
    refute list.empty?
  end

  def test_peeking_at_list
    skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_peeking_at_empty_list
    skip
    list = SimpleLinkedList.new
    assert_nil list.peek
  end

  def test_access_head_element
    skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_instance_of Element, list.head
    assert_equal 1, list.head.datum
    assert list.head.tail?
  end

  def test_items_are_stacked
    skip
    list = SimpleLinkedList.new
    list.push(1)
    list.push(2)
    assert_equal 2, list.size
    assert_equal 2, list.head.datum
    assert_equal 1, list.head.next.datum
  end

  def test_push_10_items
    skip
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    assert_equal 10, list.size
    assert_equal 10, list.peek
  end

  def test_pop_1_item
    skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.pop
    assert_equal 0, list.size
  end

  def test_popping_frenzy
    skip
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    6.times { list.pop }
    assert_equal 4, list.size
    assert_equal 4, list.peek
  end

  def test_from_a_empty_array
    skip
    list = SimpleLinkedList.from_a([])
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_nil
    skip
    list = SimpleLinkedList.from_a(nil)
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_2_element_array
    skip
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal 2, list.size
    assert_equal 1, list.peek
    assert_equal 2, list.head.next.datum
  end

  def test_from_a_10_items
    skip
    list = SimpleLinkedList.from_a((1..10).to_a)
    assert_equal 10, list.size
    assert_equal 1, list.peek
    assert_equal 10, list.head.next.next.next.next.next.next.next.next.next.datum
  end

  def test_to_a_empty_list
    skip
    list = SimpleLinkedList.new
    assert_equal [], list.to_a
  end

  def test_to_a_of_1_element_list
    skip
    list = SimpleLinkedList.from_a([1])
    assert_equal [1], list.to_a
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_to_a_of_2_element_list
    skip
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal [1, 2], list.to_a
    assert_equal 2, list.size
    assert_equal 1, list.head.datum
    assert_equal 2, list.head.next.datum
  end

  def test_reverse_2_element_list
    skip
    list = SimpleLinkedList.from_a([1, 2])
    # list_r and list need not be the same object
    list_r = list.reverse

    assert_equal 2, list_r.peek
    assert_equal 1, list_r.head.next.datum
    assert list_r.head.next.tail?
  end

  def test_reverse_10_element_list
    skip
    data = (1..10).to_a
    list = SimpleLinkedList.from_a(data)
    assert_equal data.reverse, list.reverse.to_a
  end

  def test_roundtrip_10_element_array
    skip
    data = (1..10).to_a
    assert_equal data, SimpleLinkedList.from_a(data).to_a
  end
end


#Solution
#--------------------------------------

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_elem = @head
    while (current_elem)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    element = Element.new(datum, @head)
    @head = element
  end

  def peek
    @head.datum if @head
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []
    current_elem = head
    while !current_elem.nil?
      array.push(current_elem.datum)
      current_elem = current_elem.next
    end
    array
  end

  def reverse
    list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    list
  end
end

   # - Custom Set
   # Instructions & Test Cases
#--------------------------------------

require 'minitest/autorun'
require_relative 'custom_set'

class CustomSetTest < Minitest::Test
  def test_empty
    assert_equal true, CustomSet.new.empty?
  end

  def test_not_empty
    skip
    set = CustomSet.new([1])
    assert_equal false, set.empty?
  end

  def test_empty_does_not_contain
    skip
    set = CustomSet.new
    assert_equal false, set.contains?(1)
  end

  def test_does_contain
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.contains?(1)
  end

  def test_set_does_not_contain
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.contains?(4)
  end

  def test_subset_empty
    skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new)
  end

  def test_empty_is_subset_of_non_empty
    skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new([1]))
  end

  def test_non_empty_not_subset_of_empty
    skip
    set = CustomSet.new([1])
    assert_equal false, set.subset?(CustomSet.new)
  end

  def test_set_is_subset_of_same_set_of_elements
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([1, 2, 3]))
  end

  def test_set_is_subset_of_larger_set
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([4, 1, 2, 3]))
  end

  def test_not_subset_when_different_elements
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.subset?(CustomSet.new([4, 1, 3]))
  end

  def test_disjoint_empty_set
    skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new)
  end

  def test_disjoint_empty_and_non_empty
    skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new([1]))
  end

  def test_disjoint_non_empty_and_empty
    skip
    set = CustomSet.new([1])
    assert_equal true, set.disjoint?(CustomSet.new)
  end

  def test_disjoint_shared_element
    skip
    set = CustomSet.new([1, 2])
    assert_equal false, set.disjoint?(CustomSet.new([2, 3]))
  end

  def test_disjoint_no_shared_elements
    skip
    set = CustomSet.new([1, 2])
    assert_equal true, set.disjoint?(CustomSet.new([3, 4]))
  end

  def test_eql_empty
    skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.eql?(CustomSet.new)
  end

  def test_eql_empty_and_non_empty
    skip
    empty_set = CustomSet.new
    assert_equal false, empty_set.eql?(CustomSet.new([1, 2, 3]))
  end

  def test_eql_non_empty_and_empty
    skip
    empty_set = CustomSet.new([1, 2, 3])
    assert_equal false, empty_set.eql?(CustomSet.new)
  end

  def test_eql_same_elements
    skip
    set = CustomSet.new([1, 2])
    assert_equal true, set.eql?(CustomSet.new([2, 1]))
  end

  def test_eql_different_elements
    skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.eql?(CustomSet.new([1, 2, 4]))
  end

  def test_eql_duplicate_elements_do_not_matter
    set = CustomSet.new([1, 2, 2, 1])
    assert_equal true, set.eql?(CustomSet.new([2, 1]))
  end

  def test_add_to_empty
    skip
    set = CustomSet.new
    set.add(3)
    assert_equal CustomSet.new([3]), set
  end

  def test_add_to_non_empty
    skip
    set = CustomSet.new([1, 2, 4]).add(3)
    expected = CustomSet.new([1, 2, 4, 3])
    assert_equal expected, set
  end

  def test_add_existing_element
    skip
    set = CustomSet.new([1, 2, 3]).add(3)
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, set
  end

  def test_intersection_empty
    skip
    set = CustomSet.new.intersection(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_empty_and_non_empty
    skip
    set = CustomSet.new.intersection(CustomSet.new([3, 2, 5]))
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_non_empty_and_empty
    skip
    set = CustomSet.new([3, 2, 5]).intersection(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_no_shared_elements
    skip
    first_set = CustomSet.new([1, 2, 3])
    second_set = CustomSet.new([4, 5, 6])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new

    assert_equal expected, actual
  end

  def test_intersection_shared_elements
    skip
    first_set = CustomSet.new([1, 2, 3, 4])
    second_set = CustomSet.new([3, 2, 5])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new([2, 3])

    assert_equal expected, actual
  end

  def test_difference_empty
    skip
    actual = CustomSet.new.difference(CustomSet.new)
    assert_equal CustomSet.new, actual
  end

  def test_difference_empty_and_non_empty
    skip
    actual = CustomSet.new.difference(CustomSet.new([3, 2, 5]))
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_difference_non_empty_and_empty
    skip
    actual = CustomSet.new([1, 2, 3, 4]).difference(CustomSet.new)
    expected = CustomSet.new([1, 2, 3, 4])
    assert_equal expected, actual
  end

  def test_difference_non_empty_sets
    skip
    actual = CustomSet.new([3, 2, 1]).difference(CustomSet.new([2, 4]))
    expected = CustomSet.new([3, 1])
    assert_equal expected, actual
  end

  def test_union_empty
    skip
    actual = CustomSet.new.union(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_union_empty_and_non_empty
    skip
    actual = CustomSet.new.union(CustomSet.new([2]))
    expected = CustomSet.new([2])
    assert_equal expected, actual
  end

  def test_union_non_empty_and_empty
    skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new)
    expected = CustomSet.new([1, 3])
    assert_equal expected, actual
  end

  def test_union_non_empty_sets
    skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new([2, 3]))
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, actual
  end
end


#Solution
#--------------------------------------

class CustomSet
  def initialize(set = [])
    @elements = set.uniq
  end

  def empty?
    elements.empty?
  end

  def intersection(other_set)
    same_elements = elements.select { |el| other_set.contains?(el) }
    CustomSet.new(same_elements)
  end

  def union(other_set)
    union_set = CustomSet.new(elements)
    other_set.elements.each { |el| union_set.add(el) }
    union_set
  end

  def difference(other_set)
    different_elements = elements.select { |el| !other_set.contains?(el) }
    CustomSet.new(different_elements)
  end

  def disjoint?(other_set)
    elements.none? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    return false unless elements.length == other_set.elements.length
    elements.all? { |el| other_set.contains?(el) }
  end

  def subset?(other_set)
    elements.all? { |el| other_set.contains?(el) }
  end

  def add(element)
    elements.push(element) unless contains?(element)
    self
  end

  def contains?(element)
    elements.include?(element)
  end

  def ==(other_set)
    eql?(other_set)
  end

  protected

  attr_accessor :elements
end