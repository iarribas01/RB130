class BeerSong
  def self.lyrics
    song = ""

    99.downto(1) do |n|
      song += "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
    end

    song.gsub!(/\s1\sbottles/, " 1 bottle")
    song.gsub!(/\s0\sbottles/, " no more bottles")

    song
  end

  def self.verse(num)
    lyrics.scan(/^#{num}\s.+\n.+wall\./).join
  end
end

# puts BeerSong.verse(2)