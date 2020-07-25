class Order
  attr_accessor :amount, :status

  def initialize(amount, status)
    @amount = amount
    @status = status
  end

  def pending?
    status == 'pending'
  end

  def collect_payment
    puts "Collecting payments..."
    self.status = 'paid'
  end
end

order = Order.new(100.00, 'pending')
mutex = Mutex.new

5.times.map do
  Thread.new do
    mutex.synchronize do
      if order.pending?
        order.collect_payment
      end
    end
  end
end.each(&:join)
