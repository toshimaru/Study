def setup(&block)
  @setups ||= []
  @setups << block
end

def event(description, &block)
  @events ||= []
  @events << { description: description, condition: block }
end

require_relative 'event'

@events.each do |event|
  @setups.map(&:call)
  puts "Alert: #{event[:description]}" if event[:condition].call
end
