#!/bin/bash -e

for i in `seq 1 100`; do
  wget --background --quiet "http://dummyimage.com/600x400" -O images/$i.png > /dev/null
done

