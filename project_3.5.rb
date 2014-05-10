class Time
  def at_beginning_of_year
    self.class.local(self.year, "jan", 1, 0, 0, 0)
  end
end

class Fixnum
  def days; self * 60 * 60 * 24; end

  def method_missing(method_id, *args)
    name = method_id.to_s

    if name =~/^(second|minute|hour|day)$/
      self.send(name + 's')
    else
      super
    end
  end
end

puts Time.now.at_beginning_of_year - 1.day
