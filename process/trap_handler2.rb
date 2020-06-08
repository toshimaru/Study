system_handler = trap(:INT) {
  puts 'abount to exit!'
  # system_handler.call # undefined method `call'
  system_handler.call if system_handler.respond_to?(:call)
}
sleep 10
