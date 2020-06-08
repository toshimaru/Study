puts Process.pid
trap(:INT) { print "Hello!"  }
sleep
