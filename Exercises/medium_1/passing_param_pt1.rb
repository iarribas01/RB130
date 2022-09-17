items = ['apples', 'corn', 'cabbage', 'wheat']

def gather
  puts "Let's start gathering food."
  puts yield
  puts "Nice selection of food we have gathered!"
end

gather {"#{items.join(', ')}"}