class Array
  def each_with_flattening
    self.flatten.each { |value| yield value }
  end
end


[1, [2, 3], 4, [[5, 6], 7]].each_with_flattening { |s| print "#{s}," }
# >> 1, 2, 3, 4, 5, 6, 7
