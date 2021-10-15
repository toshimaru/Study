<?php 

function lesserAndGreater(array $ary, int $pivot): array
{
  $lesser = [];
  $greater = [];
  foreach ($ary as $value) {
    if ($value < $pivot)
      $lesser[] = $value;
    else
      $greater[] = $value;
  }
  return [$lesser, $greater];
}

function qsort(array $ary): array
{
  if (empty($ary)) return $ary;
  $pivot = array_shift($ary);
  [$lesser, $greater] = lesserAndGreater($ary, $pivot);
  return array_merge(qsort($lesser), [$pivot], qsort($greater));
}

$a = [];
foreach (range(1, 20) as $i)
  $a[] = rand(1, 100);

print_r($a);
print_r(qsort($a));
