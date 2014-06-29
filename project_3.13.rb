module CurrencyExchange
  def euros
    (self * 1.3).round(3)
  end

  def yen
    (self * 0.012).round(3)
  end

  def dollars
    self.round(3)
  end

  def in(currency)
    self.send(currency)
  end

  def method_missing(method_id, *args)
    name = method_id.to_s

    if name =~/^(euro|dollar)$/
      self.send(name + 's')
    else
      super
    end
  end
end

class Fixnum
  include CurrencyExchange
end

class Float
  include CurrencyExchange
end

# assumes 1 Euro = 1.3 US dollars, 1 Yen = 0.012 US dollars
p 5.dollars.in(:euros)  # => 6.5
p (1.euro - 50.yen).in(:dollars)  # => 0.700
