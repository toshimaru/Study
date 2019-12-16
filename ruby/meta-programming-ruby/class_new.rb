## Original:
#class MyClass < Array
#  def my_method
#    'hello!'
#  end
#end

MyClass = Class.new(Array) do
  def my_method
    'hello!'
  end
end

p MyClass.name
