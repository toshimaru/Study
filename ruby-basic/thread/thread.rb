require 'open-uri'
 
thr = []
(1..100).each do |i|
  thr << Thread.new do
    open("./images/#{i}.png", 'wb') do |f|
      f.write open("http://dummyimage.com/600x400").read
    end
  end
end
thr.map(&:join)

=begin
Result
---
time ruby thread.rb
ruby thread.rb  0.21s user 0.09s system 21% cpu 1.352 total
=end
