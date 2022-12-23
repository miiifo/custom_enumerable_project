
module Enumerable
  def my_each_with_index
    i = 0
    if block_given?
      for e in self
        yield e, i
        i += 1
      end
    end
  end

  def my_select
    return unless block_given?
    result = []
    my_each { |e| result.push(e) if yield e }
    result
  end

  def my_all?
    my_each { |e| return false unless yield e }
    true
  end

  def my_any?
    my_each { |e| return true if yield e }
    false
  end

  def my_none?
    my_each { |e| return false if yield e }
    true
  end

  def my_count
    i=0
    if block_given?
      my_each { |e| i += 1 if yield e }
    else
      my_each { |e| i += 1 }
    end
    i
  end

  def my_map
    new_arr = []
    my_each { |e| new_arr.push(yield e) }
    new_arr
  end

  def my_inject(initial_value)
    my_each { |v| initial_value = yield(initial_value, v) }
    initial_value
  end
end

class Array
  def my_each
    if block_given?
      for e in self
        yield e
      end
    end
  end
end
