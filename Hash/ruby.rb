# frozen_string_literal: true

class HashMap
  Pair = Struct.new(:key, :val)

  def initialize
    @size = 0
    @capacity = 2
    @map = Array.new(@capacity)
  end

  def hash(key)
    key.each_byte.sum % @capacity
  end

  def get(key)
    index = hash(key)
    while pair = @map[index]
      return pair.val if pair.key == key
      index += 1
      index = index % @capacity
    end
  end

  def put(key, val)
    index = hash(key)

    loop do
      if @map[index].nil?
        @map[index] = Pair.new(key, val)
        @size += 1
        rehash if @size >= @capacity
        break
      elsif @map[index].key == key
        @map[index].val = val
        break
      end

      index += 1
      index = index % @capacity
    end
  end

  def remove(key)
    return if get(key).nil?

    index = hash(key)
    loop do
      pair = @map[index]
      if pair.key == key
        @map[index] = nil
        @size -= 1
        break
      end
      index += 1
      index = index % @capacity
    end
  end

  def rehash
    @capacity *= 2
    old_map = @map
    @map = Array.new(@capacity)
    @size = 0
    old_map.each do |pair|
      put(pair.key, pair.val) if pair
    end
  end

  private

  def to_s
    "size: #{@size}, capacity: #{@capacity} map: #{@map.compact.to_s}"
  end
end

=begin
hash_map = HashMap.new
puts hash_map

hash_map.put("a", 1)
puts hash_map
puts hash_map.get("a")
hash_map.put("a", 10)
puts hash_map
puts hash_map.get("a")

hash_map.put("b", 2)
puts hash_map

hash_map.put("c", 3)
puts hash_map

hash_map.put("d", 5)
puts hash_map
puts hash_map.get("x")

hash_map.remove("a")
hash_map.remove("x")
puts hash_map
=end
