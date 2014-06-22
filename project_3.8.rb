class FibSequence
  include Enumerable

  def initialize(max)
    @fib_nums = [1, 1]

    if max > 2
      index = 2
      while index != max
        @fib_nums << @fib_nums[index - 1] + @fib_nums[index - 2]
        index += 1
      end
    elsif max > 0 && max <= 2
      @fib_nums = @fib_nums[0..max]
    else
      @fib_nums = []
    end
  end

  def each(&block)
    @fib_nums.each(&block)
  end
end

# Fibonacci iterator should be callable like this:
f = FibSequence.new(6) # just the first 6 Fibonacci numbers
f.each { |s| print(s, ':') }  # => 1:1:2:3:5:8:
puts ""
p f.reject { |s| s.odd? }      # => [2, 8]
p f.reject(&:odd?)             # => [2, 8] (a shortcut!)
p f.map { |x| 2 * x }            # => [2, 2, 4, 6, 10, 16]
