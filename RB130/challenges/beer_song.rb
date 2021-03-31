## Some mistake I can't figure out right now, but I should extract some of the logic anyways in separate methods instead of chunking everything up
## Solution 1

# class BeerSong
#   def self.verse(line)
#     case line
#     when (3..99) then "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
#       "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
#     when 2 then "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
#       "Take one down and pass it around, #{line - 1} bottle of beer on the wall.\n"
#     when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#     when 0 then "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end
#   end

#   def self.verses(start_line, end_line)
#     text = ''
#     (start_line..end_line).each do |line|
#       p line
#       if (3..99).to_a.include?(line)
#         text << "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
#         "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
#       elsif line == 2
#         text << "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" \
#         "Take one down and pass it around, #{line - 1} bottle of beer on the wall.\n"
#       elsif line == 1
#         text << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#         "Take it down and pass it around, no more bottles of beer on the wall.\n"
#       elsif line == 0
#         text << "No more bottles of beer on the wall, no more bottles of beer.\n" \
#         "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#       end
#     end
#     text
#   end

#   def self.lyrics
#     verses(99, 0)
#   end

# end

# BeerSong.lyrics


## Second Time

class BeerSong
  def self.verse(num)
    text(num)
  end

  def self.verses(start, stop)
    array = (start..stop).to_a
    counter = start
    expected = []
    while stop <= counter
      expected << "#{text(counter)}"
      counter -= 1
    end
     expected.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.text(number)
    if number > 2
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number -1} bottles of beer on the wall.\n"
    elsif number == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
