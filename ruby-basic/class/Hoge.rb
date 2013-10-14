class Hoge
  @@clsvar = 'class-var'
  @instvar = 'instance-var'

  def initialize
    @instvar = 'constructor instance-var'
  end

  def hello
    puts 'hello'
  end

  def self.s_hello
    puts 'self hello'
  end

  def say(str)
    puts str
  end

  def clsvar
    puts @@clsvar
  end

  def instance_var
    puts @instvar
  end

  attr_accessor :instvar

end