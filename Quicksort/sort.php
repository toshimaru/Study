<?php 

function qsort(array $ary) {
  if (empty($ary)) return $ary;

  $lesserAndGreater = function(array $a, $pivot) {
    $lesser = array();
    $greater = array();
    foreach ($a as $value) {
      if ($value < $pivot)
        $lesser[] = $value; 
      else
        $greater[] = $value;
    }
    return array($lesser, $greater);
  };

  $pivot = array_shift($ary);
  list($lesser, $greater) = $lesserAndGreater($ary, $pivot);
  return array_merge(qsort($lesser), array($pivot), qsort($greater));
}


$a = array();
foreach (range(1, 10) as $i) {
  $a[] = rand(1, 100);
}

print_r($a);
print_r(qsort($a));
