module CustomSetterAndGetter
  def attr_accessor_with_history(*names)
    names.each do |name|
      self.class_variable_set("@@#{name}", [])

      define_method(name) { instance_variable_get("@#{name}") }

      define_method("#{name}=") do |arg|
        instance_variable_set("@#{name}", arg)
        history = self.class.class_variable_get("@@#{name}")
        history << arg
        self.class.class_variable_set("@@#{name}", history)
      end

      define_method("history") { |arg| self.class.class_variable_get("@@#{arg.to_s}") }
    end
  end
end

class Foo
  extend CustomSetterAndGetter
  # A modifed attr_accessor
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 3
puts f.bar

f.bar = :wowzo
puts f.bar

f.bar = 'boo!'
puts f.bar

p f.history(:bar)
