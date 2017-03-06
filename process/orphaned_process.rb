fork do
  5.times do
    sleep 1
    puts "I'm an orphan!"
  end
end

abort "parent process died..."
