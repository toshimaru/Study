def valid_anagram?(s1, s2)
  h1 = Hash.new { |h, k| h[k] = 0 }
  h2 = Hash.new { |h, k| h[k] = 0 }

  s1.each_char { |c| h1[c] += 1  }
  s2.each_char { |c| h2[c] += 1  }

  h1 == h2
end

def valid_anagram2?(s1, s2)
  s1.chars.sort == s2.chars.sort
end

p valid_anagram?("abc", "cba")
p valid_anagram?("abc", "cda")
p valid_anagram?("hello world", "wdlrol lohe")

p valid_anagram2?("abc", "cba")
p valid_anagram2?("abc", "cda")
p valid_anagram2?("hello world", "wdlrol lohe")

require 'benchmark/ips'
Benchmark.ips do |x|
  x.report("valid_anagram") {
    valid_anagram?("hello world", "wdlrol lohe")
  }
  x.report("valid_anagram2") {
    valid_anagram2?("hello world", "wdlrol lohe")
  }
  x.compare!
end
