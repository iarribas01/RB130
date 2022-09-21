require 'stringio'

# class Restaurant
#   def serve_food(input: $stdin, output: $stdout)
#     puts "Serving the food now..."
#     response = input.gets.chomp
#     if (response == "let's eat!")
#       output.puts "Bon appetit!"
#     else
#       output.puts "Just wait one more moment..."
#     end
#   end
# end

output = StringIO.new
puts "Before: #{output}"
output.puts "some useful message"
puts "After: #{output}"