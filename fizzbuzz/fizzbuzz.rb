def fizzbuzz(max)
  (1..max).each{|n|
    if (n % 15 == 0)
      p 'fizzbuzz'
    elsif (n % 5 == 0)
      p 'buzz'
    elsif (n % 3 == 0)
      p 'fizz'
    else
      p n
    end
  } 
end

fizzbuzz(100)
