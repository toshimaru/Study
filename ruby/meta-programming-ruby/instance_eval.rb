class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

new_v = 10
obj.instance_eval do
  p self # `self` becomes `obj`
  p @v
  @v = new_v
  p @v
end
