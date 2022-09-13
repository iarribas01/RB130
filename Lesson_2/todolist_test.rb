require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'


SimpleCov.start

Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_all_not_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_all_done
    @list.done!
    new_list = @list.all_done
    assert(new_list.to_a, @list.to_a)
  end
  
  def test_shift
    new_array = @todos.clone[1..-1]
    first_item = @list.shift
    assert_equal(first_item, @todo1)
    assert_equal(new_array, @list.to_a)
  end

  def test_pop
    last_item = @list.pop
    assert_equal(last_item, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done
    refute(@list.done?)
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert(@list.done?)
  end

  def test_undone
    @todo1.done! 
    assert(@todo1.done?)
    @todo1.undone!
    refute(@todo1.done?)
  end

  def test_raise_typerror
    assert_raises(TypeError) do 
      @list.add("hello")
    end
  end

  def test_shovel
    new_todo = Todo.new("Do laundry")
    @list << new_todo
    assert_equal(@list.last, new_todo)
  end

  def test_alias_shovel_and_add
    new_todo = Todo.new("Buy groceries")
    other_list = @list.clone

    @list << new_todo
    other_list.add(new_todo)
    
    assert_equal(@list.to_a, other_list.to_a)
    assert_raises(TypeError) {@list.add("string")}
  end

  def test_item_at
    assert_equal(@list.item_at(1), @todo2)
    assert_raises(IndexError){@list.item_at(100)}
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert(@todo2.done?)
    refute(@todo1.done?)
    refute(@todo3.done?)
    assert_raises(IndexError){@list.mark_done_at(100)}
  end

  def test_mark_undone_at
    @todo1.done!

    assert_raises(IndexError) {@list.mark_undone_at(100)}
    
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done

    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError){@list.remove_at(100)}
    item_removed = @list.remove_at(1)

    assert_equal(item_removed, @todo2)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_all_todos_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_single_todo_to_s 
    assert_equal("[ ] Buy milk", @todo1.to_s)
    @todo1.done!
    assert_equal("[X] Buy milk", @todo1.to_s)
  end

  def test_marked_todos_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s 
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    # test that it is actualy iterating

    @list.each {|todo| todo.done!}
    assert(@list.done?)
    # optional - test that it returns original obj

    assert_equal(@list.each{ |_| }, @list)
  end

  def test_each
    assert_equal(@list.each{ |_| }, @list)
  end

  def test_select
    @todo1.done!
    @todo2.done!

    new_list = @list.select{|todo| todo.done?}
    assert_equal(new_list.to_a, [@todo1, @todo2])
  end


end


