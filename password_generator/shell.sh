# cat /dev/urandom | base64 | head -c 20
cat /dev/urandom | base64 | fold -w 20 | head -n 10
