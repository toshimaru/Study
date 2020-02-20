class String
  alias_method :old_reverse, :reverse

  def reverse
    "← #{old_reverse} ←"
  end
end

puts "abcdef".reverse
