# frozen_string_literal: true

def slow_gas_station(gas, cost)
  traversed_i = gas.size.times.find { |i| can_traverse?(gas, cost, i) }
  traversed_i || -1
end

def my_gas_station(gas, cost)
  return - 1 if cost.sum > gas.sum
  i, n = 0, gas.size

  while i <= n 
    remaining = 0
    gas.size.times.with_index(1) do |j, idx|
      j = (i + j) % n
      remaining += gas[j] - cost[j]
      if remaining < 0
        i = j
        break
      elsif idx == n
        return i
      end
    end
    i += 1
  end

  -1
end

def gas_station(gas, cost)
  remaining = prev_remaining = candidate = 0
  n = gas.size

  n.times do |i|
    remaining += gas[i] - cost[i]
    if remaining < 0
      candidate = i + 1
      prev_remaining += remaining
      remaining = 0
    end
  end
  
  return -1 if candidate == n || remaining + prev_remaining < 0
  candidate
end

def can_traverse?(gas, cost, start)
  n, i, remaining = gas.size, start, 0
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
p my_gas_station(gas, cost)
p gas_station(gas, cost)

gas  = [2,2,2,2,2,2]
cost = [1,1,1,1,1,50]
p slow_gas_station(gas, cost)
p my_gas_station(gas, cost)
p gas_station(gas, cost)

gas  = [1,1,1,10]
cost = [2,2,2,2]
p slow_gas_station(gas, cost)
p my_gas_station(gas, cost)
p gas_station(gas, cost)
