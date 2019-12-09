class Resource
  def dispose
    @disposed = true
  end

  def disposed?
    @disposed
  end
end

module Kernel
  def with(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end

r = Resource.new
with(r) {}
p r.disposed?
