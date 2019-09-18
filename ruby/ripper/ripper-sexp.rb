require 'ripper'
require 'pp'

code = <<~RUBY
  10.times do |n|
    puts n
  end
RUBY

puts code
pp Ripper.sexp(code)
