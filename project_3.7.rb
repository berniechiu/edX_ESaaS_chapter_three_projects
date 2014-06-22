module Enumerable
  def each_with_custom_index(start_index, interval)
    index = start_index
    self.each do |object|
      yield object, index
      index += interval
    end
  end
end

%w(alice bob carol).each_with_custom_index(3, 2) do |person, index|
  puts ">> #{person} is number #{index}"
end
