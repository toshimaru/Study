100.times {
  Thread.new { sleep }
}

puts Process.pid
sleep

=begin
PID    COMMAND      %CPU TIME     #TH  #WQ  #POR MEM  PURG CMPR PGRP  PPID  STATE    BOOSTS
64400  ruby         0.0  00:00.07 102  0    115  11M  0B   0B   64400 54035 sleeping *0[1]
=end
