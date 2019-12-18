class Integer
  alias_method :old_plus, :+

  def +(value)
    self.old_plus(value).old_plus(value)
  end
end

p 1 + 1
p 1 + 2
