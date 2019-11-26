class MyClass
end

# irb(main):006:0> obj = MyClass.new
# => #<MyClass:0x00007fe68c925ea8>
# irb(main):007:0> obj.class
# => MyClass
# irb(main):008:0> MyClass.class
# => Class
# irb(main):009:0> Class.class
# => Class

# irb(main):011:0> MyClass.superclass
# => Object
# irb(main):012:0> Object.superclass
# => BasicObject
# irb(main):013:0> BasicObject.superclass
# => nil
