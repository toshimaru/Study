require 'thread'

class BlockingQueue
  def initialize
    @storage = []
    @mutex = Mutex.new
    @condvar = ConditionVariable.new
  end

  def push(itesm)
    @mutex.synchronize do
      @storage.push(item)
      @condvar.signal
    end
  end

  def pop
    @mutex.synchronize do
      while @storage.empty?
        @condvar.wait(@mutex)
      end
      @storage.shift
    end
  end
end
