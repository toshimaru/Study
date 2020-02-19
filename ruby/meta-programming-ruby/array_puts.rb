ary = [1,2,3]

ary.each {|x| puts x}
ary.each(&method(:puts))

hash = {a:1, b:2}
hash.each(&method(:p))
