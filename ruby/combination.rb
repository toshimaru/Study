numbers = [1, 2, 3, 4, 5]

# By ChatGPT
combinations = []
numbers.each_with_index do |num1, index1|
  numbers.each_with_index do |num2, index2|
    if index2 > index1
      combinations << [num1, num2]
    end
  end
end
p combinations


# My solution
a = []
numbers.each_with_index do |num1, i1|
  numbers[i1+1..].each do |num2|
    a << [num1, num2]
  end
end
p a
