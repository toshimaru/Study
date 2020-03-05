class Foo; end

p self.singleton_class
p "Singleton Class".singleton_class
p Foo.singleton_class
p Foo.new.singleton_class
