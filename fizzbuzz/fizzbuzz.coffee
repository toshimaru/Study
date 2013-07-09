fz = (max) ->
  for number in [1..max]
    if number % 15 is 0
      console.log "fizzbuzz"
    else if number % 5 is 0
      console.log "buzz"
    else if number % 3 is 0
      console.log "fizz"
    else
      console.log number

fz(100)