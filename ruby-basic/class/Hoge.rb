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

  def clsvar
    puts @@clsvar
  end

  def instance_var
    puts @instvar
  end

  def call_private
    puts pri
  end

  private

    def pri
      'private method ' + private_hello
    end

    def private_hello
      'private_hello'
    end

end
