class Image
  attr_reader :val

  def set_val(val)
    @val = val
  end
end

# irb(main):020:0* i = Image.new
# => #<Image:0x007fb9cba13f38>
# irb(main):021:0> i.val
# => nil
# irb(main):022:0> i.set_val "test"
# => "test"
# irb(main):023:0> i.val
# => "test"
