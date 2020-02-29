#!/usr/bin/env ruby

def monty_hall(resample)
  choices = (0..2).to_a

  10_000.times.count do
    answer = choices.sample
    select = choices.sample
    wrong_answer = (choices - [select, answer]).sample
    
    select = (choices - [wrong_answer, select]).first if resample

    select == answer
  end
end

puts "resample correct count: #{monty_hall(true)}"
puts "not resample correct count: #{monty_hall(false)}"
