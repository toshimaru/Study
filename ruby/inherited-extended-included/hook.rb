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

class IncludeClass
  include ParentModule
  extend ParentModule
end
