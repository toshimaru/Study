p Process.getrlimit(:NOFILE)
# This returns array of soft-limit and hard-limit

Process.setrlimit(:NOFILE, 3)
p Process.getrlimit(:NOFILE)

File.open "/dev/null" # Too many open files!!
