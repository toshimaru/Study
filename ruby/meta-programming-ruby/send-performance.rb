require 'benchmark/ips'

class Foo
  def hi
    "Hi!"
  end
end

Benchmark.ips do |x|
  foo = Foo.new

  x.report("send") {
    foo.send :hi
  }

  x.report("public_send") {
    foo.public_send :hi
  }

  x.report("__send__") {
    foo.__send__ :hi
  }

  x.compare!
end
