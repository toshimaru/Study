<?php 

function bubblesort($ary) {
  $n = count($ary) - 2;
  foreach (range(0, $n) as $i) {
    foreach (range(0, $n - $i) as $j) {
      if ($ary[$j] > $ary[$j + 1]) {
        list($ary[$j], $ary[$j + 1]) = array($ary[$j + 1], $ary[$j]);
      }
    }
  }
  return $ary;
}

$array = array(4,3,2,1,0);
print_r(bubblesort($array));
