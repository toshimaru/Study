require './Hoge'

# Hoge.hello # => error
Hoge.s_hello # => self hello
Hoge.new.hello # => hello

# Create instance
h = Hoge.new
h.hello # => hello
h.say('hello!!!') # => class-var

# access to class variable and instance variable
h.class_var    # => class-var
h.instance_var # => constructor instance-var

h.instvar = 'changed instance-var'
h.instance_var # => changed instance-var
puts h.instvar # => changed instance-var
h.call_private # => private method

Hoge.clsvar = 'changed cls-var'
h.class_var      # => class-var
puts Hoge.clsvar # => changed cls-var
