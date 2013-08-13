<?php

function era($n) {
    $primes = array();
    foreach (range(2, $n) as $i) {
        $primes[$i] = true;
    }

    foreach (range(2, sqrt($n)) as $i) {
        if ($primes[$i]) {
            for ($j = $i * $i ; $j <= $n; $j += $i) {
                $primes[$j] = false;
            }
        }    
    }

    $p = array();
    foreach ($primes as $prime => $isPrime) {
        if ($isPrime) {
            $p[] = $prime;
        }
    }
    return $p;
}

print_r(era(100));

