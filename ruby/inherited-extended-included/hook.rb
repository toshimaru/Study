class ParentClass
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end

  def self.extended(obj)
    puts "#{obj} extend #{self}"
  end

  def self.included(mod)
    puts "#{mod} include #{self}"
  end
end

module ParentModule
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end

  def self.extended(obj)
    puts "#{obj} extend #{self}"
  end

  def self.included(mod)
    puts "#{mod} include #{self}"
  end
end

class ChildClass < ParentClass
end

# superclass must be an instance of Class (given an instance of Module) (TypeError)
# class ChildClass2 < ParentModule
# end

class IncludeClass
  include ParentModule
  extend ParentModule
end
