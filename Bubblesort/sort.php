<?php 

function bubblesort(array $ary) {
  $n = count($ary) - 2;
  foreach (range(0, $n) as $i) {
    foreach (range(0, $n - $i) as $j) {
      if ($ary[$j] > $ary[$j + 1]) {
        [$ary[$j], $ary[$j + 1]] = [$ary[$j + 1], $ary[$j]];
      }
    }
  }
  return $ary;
}

$array = array(4,3,2,1,0);
print_r($array);
print_r(bubblesort($array));
