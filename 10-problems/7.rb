# frozen_string_literal: true

def slow_gas_station(gas, cost)
  traversed_i = gas.size.times.find { |i| can_traverse?(gas, cost, i) }
  traversed_i || -1
end

def can_traverse?(gas, cost, start)
  n = gas.size
  remaining = 0
  i = start
  started = false

  while i != start || !started
    started = true
    remaining += gas[i] - cost[i]
    return false if remaining < 0
    i = (i + 1) % n
  end

  true
end

gas  = [1,5,3,3,5,3,1,3,4,5]
cost = [5,2,2,8,2,4,2,5,1,2]
p slow_gas_station(gas, cost)

gas  = [2,2,2,2,2,2]
cost = [1,1,1,1,1,50]
p slow_gas_station(gas, cost)
