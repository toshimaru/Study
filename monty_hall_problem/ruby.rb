#!/usr/bin/env ruby

def monty_hall(resample)
  choices = (0..2).to_a

  1000.times.count do
    answer = choices.sample
    select = choices.sample
    wrong_answer = (choices - [select, answer]).sample
    
    select = (choices - [wrong_answer, select]).first if resample

    # puts "answer: #{answer}, select: #{select}, wrong_answer: #{wrong_answer}"
    select == answer
  end
end

puts monty_hall true
puts monty_hall false
