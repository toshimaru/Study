require 'thread'
require 'net/http'

mutex = Mutex.new
@results = []

100.times.map do
  Thread.new do
    mutex.synchronize do
      response = Net::HTTP.get_response('dynamic.xkcd.com', '/random/comic')
      random_comic_url = response['Location']
      @results << random_comic_url
    end
  end
end.each(&:join)

puts @results

# # comparison
#
# 1. ruby fine_mutex.rb  
# 0.17s user 0.11s system 12% cpu 2.256 total
#
# 2. ruby coarse_mutex.rb
# 0.21s user 0.13s system 0% cpu 38.879 total
