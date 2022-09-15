def extract_encrypted_pioneers(filename)
  encrypted_pioneers = []

  File.open(filename) do |file|
    file.each do |line|
      encrypted_pioneers << line.chomp
    end
  end

  encrypted_pioneers
end

def decrypt(str, key)
  str.chars.map do |letter|
    key[letter]
  end.join.capitalize
end

def generate_key(num_rotations)
  key = {}
  alphabet = ('a'..'z').to_a
  rotated_alphabet = alphabet[num_rotations..26] + alphabet[0...num_rotations]
  
  rotated_alphabet.each_with_index do |letter, index|
    key[alphabet[index]] = rotated_alphabet[index]
  end
  key[" "] = " "

  key
end

key = generate_key(13)

extract_encrypted_pioneers("encrypted_pioneers.txt").each do |pioneer|
  puts decrypt(pioneer.downcase, key)
end





