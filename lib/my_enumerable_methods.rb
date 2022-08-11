require 'pry-byebug'

module Enumerable
  # Your code goes here

  def my_each_with_index
    idx = 0
    length = self.length
    until idx == length
      yield self[idx], idx
      idx += 1
    end
    self
  end

  def my_all?(&block)
    flag = true
    # binding.pry
    self.my_each do |element|
      flag = false unless block.call(element)
    end
    return flag
  end

  def my_any?(&block)
    flag = false
    self.my_each do |element|
      flag = true if block.call(element)
    end
    return flag
  end

  def my_none?(&block)
    !self.my_any?(&block)
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for value in self do
      yield value
    end
    self
  end
end