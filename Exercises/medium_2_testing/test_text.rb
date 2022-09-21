require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'

Minitest::Reporters.use!

class TextTest < Minitest::Test 
  def setup 
    @file = File.open("sample_text.txt")
    @text = Text.new(@file.read)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

  def test_swap 
    actual_text = @text.swap('a', '!').gsub(/\r/,"")
    expected_result = <<~EXPECTED_RESULT.strip
    Hello!
    My n!me is Piper.
    I like to bite necks.
    I !m ! Germ!n Shep.
    EXPECTED_RESULT
    assert_equal(expected_result, actual_text)
  end

  def test_word_count
    assert_equal(15, @text.word_count)
  end
end