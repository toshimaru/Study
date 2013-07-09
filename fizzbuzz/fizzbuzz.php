<?php

function fizzbuzz($max) {
  foreach (range(1, $max) as $value) {
    if ($value % 15 === 0) echo 'fizzbuzz';
    elseif ($value % 3 === 0) echo 'fizz';
    elseif ($value % 5 === 0) echo 'buzz';
    else echo $value;
    echo PHP_EOL;
  }
};

fizzbuzz(100);
