# def print_class_and_superclasses(object)
#   klass = object.class
#   superklass = klass.superclass

#   puts klass

#   while superklass
#     puts superklass
#     superklass = superklass.superclass
#   end
# end

def print_class_and_superclasses(object)
  object.class.ancestors.each do |klass|
    puts klass
  end
end

print_class_and_superclasses(5)
