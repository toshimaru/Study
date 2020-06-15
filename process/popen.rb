IO.popen('less', 'w') do |stream|
  stream.puts "some\ndata"
end
