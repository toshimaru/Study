# ref. http://www.jstorimer.com/blogs/workingwithcode/8085491-nobody-understands-the-gil

array = []

5.times.map do
  Thread.new do
    puts "before push: #{array.length.to_s}"
    50.times do |i|
      puts "[#{Thread.current}]#{i}"
      array << nil
    end
    puts "after push: #{array.length.to_s}"
  end
end.each(&:join)

puts array.size
