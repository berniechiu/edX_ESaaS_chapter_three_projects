module Enumerable
  def each_permuted
    collections = []

    # Inside-out algorithm for shuffle
    self.each do |item|
      rand_num = Random.rand(collections.size + 1)

      if rand_num == collections.size
        collections << item
        p collections
      else
        collections << collections[rand_num]
        collections[rand_num] = item
        p collections
      end
    end

    collections.each do |item|
      yield item
    end
  end
end

[1, 2, 3, 4, 5].each_permuted { |v| print "#{v} " }
