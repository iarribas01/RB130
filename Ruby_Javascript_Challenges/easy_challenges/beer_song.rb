class BeerSong
  def self.lyrics
    song = ""

    99.downto(1) do |n|
      song += "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
    end

    song.gsub!(/^1 bottles/, " 1 bottle")
    song.gsub!(/ 1 bottles/, " 1 bottle")
    song.gsub!(/ 0 bottles/, " no more bottles")

    song
  end

  def self.verse(num)
    lyrics.scan(/^#{num} .+\n.+wall\.\n*/).join
  end

  def self.verses(start_verse, end_verse)
    if (end_verse < start_verse && end_verse >= 0 ** start_verse < 100) 
      lyrics.scan(/^#{start_verse} .+\n+pass it around, #{end_verse-1} .+/).join
    end
  end
end

# puts BeerSong.verse(99)
# p BeerSong.lyrics.scan(/^#{2} .+\n.+wall\.\n/)