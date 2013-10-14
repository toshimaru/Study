i = gets.to_i
raintimes = []
i.times {
  raintimes << gets.chomp.split("-")
}

def convertStartTime(time)
  case time[-1].to_i
  when 0..4
    time[0,3] + '0'
  when 5..9
    time[0,3] + '5'
  end
end

def convertEndTime (time)
  case time[-1].to_i
  when 0
    time
  when 1..5
    time[0,3] + '5'
  when 6..9
    tenmin = time[2].to_i
    if tenmin < 5
      time.to_i.round(-1).to_s
    else
      ((time[0,2].to_i + 1) * 100).to_s
    end
  end
end

convertedTimes = []

raintimes.each { |start, endt|
  start = convertStartTime(start)
  endt  = convertEndTime(endt)
  convertedTimes << [start, endt].map(&:to_i)
}

convertedTimes.sort!.uniq!

convertedTimes.size.times do |t|
  next if t == 0
  if convertedTimes[t-1][1] >= convertedTimes[t][1]
    convertedTimes[t] = convertedTimes[t-1]
    convertedTimes[t-1] = nil
  elsif convertedTimes[t-1][1] >= convertedTimes[t][0]
    convertedTimes[t][0] = convertedTimes[t-1][0]
    convertedTimes[t-1] = nil
  end
end
# thanks to http://abc001.contest.atcoder.jp/submissions/109383

convertedTimes.compact.each{|p|
  puts p.map{|n| "%04d" % n}.join('-')
}
