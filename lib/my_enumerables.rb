module Enumerable
  # Your code goes here

  def my_select
    return unless block_given?
    arr = []
    self.my_each do |item|
      arr.push(item) if yield(item)
    end
    arr
  end

  def my_all?
    return true unless block_given?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end
  def my_any?
    return false unless block_given?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
    self
  end

  def my_count
    return my_count2 unless block_given?
    count = 0
    self.my_each do |item|
      count+=1 if yield(item)
    end
    count
  end

  def my_count2
    count = 0
    self.my_each do |item|
      count +=1
    end
    count
  end
  def my_inject(initial = nil)
    acc = initial
    self.my_each do |item|
      if acc.nil?
        acc = item
      else
        acc = yield(acc, item)
      end

    end
    acc
  end
  def my_map
    return unless block_given?
    arr = []
    self.my_each do |item|
      arr.push(yield(item))
    end
    arr
  end
  def my_none?
    return true unless block_given?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end
end




# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?
    for item in self
      yield(item)
    end
    self
  end
end



arr = [1, 2, 3, 4, 5]

p arr.my_inject {|n,sum| n-sum}
