require './Hoge'

# Hoge.hello # => error
Hoge.s_hello # => self hello

Hoge.new.hello # => hello

h = Hoge.new
h.hello # => hello
h.say('hello!!!') # => class-var
h.clsvar # => class-var
h.instance_var # => constructor instance-var

h.instvar = 'changed instance-var'
h.instance_var # => changed instance-var
puts h.instvar # => changed instance-var

h.call_private
