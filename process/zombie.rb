pid = fork { sleep 3 }
puts pid
sleep 10

# `ps -ho pid,state -p {pid}`
# You can see zombie pid
