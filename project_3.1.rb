# The fifth one returns nil, so its ancestors should be 4
# 5.class.superclass.superclass.superclass.superclass

p 5.class.ancestors.count
# Another method for calling ancestors (this one includes module count)
