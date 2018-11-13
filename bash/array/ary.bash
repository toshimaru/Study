#!/bin/bash -e

ary=()
loop_ary=(a b c)
echo '---- push array result to $ary ---'
echo $loop_ary
echo ${loop_ary[@]}
for i in ${loop_ary[@]}; do
  echo $i
  ary+=($i)
done
echo ${ary[@]}

echo '--- list ls result ----'
ary2=$(ls)
echo $ary2
for i in ${ary2[@]}; do
  echo $i
done
