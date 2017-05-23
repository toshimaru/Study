# Why included? class_eval?
# http://qiita.com/castaneai/items/6dc121ce6ff100614f42

# http://unageanu.hatenablog.com/entry/20080413/1208083475

module Piyo
  module ActsAsMethodsDayooooooo
    def hello
      puts "Hello!"
    end
  end
end

module Hoge1
  def self.included(base)
    puts "included!"
    base.class_eval do
      extend Piyo::ActsAsMethodsDayooooooo
    end
  end
end

module Hoge2
  class << self
    def hello
      puts "hello2!"
    end
  end
end

class A
  include Hoge2
end

puts A.hello
