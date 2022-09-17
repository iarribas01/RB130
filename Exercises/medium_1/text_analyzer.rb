class TextAnalyzer
  def process
    # your implementation
    file = File.open("some_file.txt")
    file_data = file.read
    yield(file_data)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process {|text| puts text}

analyzer.process {|text| puts text.split("\r\n").first.upcase }

analyzer.process do |text|
  text.upcase!
  puts text
end