require 'open-uri'
 
(1..100).each do |i|
  open("./images/#{i}.png", 'wb') do |f|
    f.write open("http://dummyimage.com/600x400").read
  end
end

=begin
Result
----
time ruby no_thread.rb
ruby no_thread.rb  0.23s user 0.09s system 1% cpu 26.329 total
=end
