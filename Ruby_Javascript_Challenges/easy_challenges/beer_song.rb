class BeerSong
  def self.lyrics
    song = ""

    99.downto(1) do |n|
      song += "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n\n"
    end

    song.gsub!(/\s1\sbottles/, " 1 bottle")
    song.gsub!(/\s0\sbottles/, " no more bottles")

    song
  end

  def self.verse(num)
    lyrics.scan(/^#{num} .+\n.+wall\./).join
  end

  def self.verses(start_verse, end_verse)
    lyrics.scan(/^#{start_verse} bottles (.|\n)+pass it around, #{end_verse-1} .+/).join
  end
end

# puts BeerSong.verse(2)