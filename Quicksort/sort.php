<?php 

function qsort(array $ary) {
  if (empty($ary)) return $ary;

  $lesserAndGreater = function(array $ary, int $pivot) {
    $lesser = [];
    $greater = [];
    foreach ($ary as $value) {
      if ($value < $pivot)
        $lesser[] = $value; 
      else
        $greater[] = $value;
    }
    return [$lesser, $greater];
  };
  $pivot = array_shift($ary);
  [$lesser, $greater] = $lesserAndGreater($ary, $pivot);
  return array_merge(qsort($lesser), [$pivot], qsort($greater));
}

$a = [];
foreach (range(1, 10) as $i)
  $a[] = rand(1, 100);

print_r($a);
print_r(qsort($a));
