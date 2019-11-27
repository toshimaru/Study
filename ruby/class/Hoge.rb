class Hoge
  attr_accessor :instvar

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

  def class_var
    puts @@clsvar
  end

  def instance_var
    puts @instvar
  end

  def call_private
    pri
  end

  class << self
    attr_accessor :clsvar
  end

  private

    def pri
      puts 'private method'
    end

end
