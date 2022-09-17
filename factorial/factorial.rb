# ref. https://blog.toshima.ru/2022/08/21/ruby-factorial-function.html
def factorial(num)
	num.downto(1).inject(:*)
end

def recurse_factorial(num)
	return 1 if num < 2

	num * recurse_factorial(num - 1)
end

puts factorial(5)
puts recurse_factorial(5)
