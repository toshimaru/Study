# Why included? class_eval?
# http://qiita.com/castaneai/items/6dc121ce6ff100614f42
# http://unageanu.hatenablog.com/entry/20080413/1208083475

module Module0
  def hello = puts "Hello!"
end

module Module1
  def self.included(base)
    base.extend Module0

    # or Use class_eval
    # base.class_eval do
      # extend Module0
    # end
  end
end

module Module2
  class << self
    def hello = puts "hello!"
  end
end

class A
  include Module1
end
class B
  include Module2
end

puts A.hello
# undefined method `hello'
# puts B.hello
