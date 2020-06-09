reader, writer = IO.pipe

fork do
  puts 1
  reader.close

  10.times do
    writer.puts "Another one bites the dust"
  end
end

puts 2
writer.close
# writer.puts "test" => close stream IOerror
puts 3

while message = reader.gets
  $stdout.puts message
end
