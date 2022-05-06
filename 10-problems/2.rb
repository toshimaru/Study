def valid?(s1, s2)
  h1 = Hash.new { |h, k| h[k] = 0 }
  h2 = Hash.new { |h, k| h[k] = 0 }

  s1.each_char { |c| h1[c] += 1  }
  s2.each_char { |c| h2[c] += 1  }

  h1 == h2
end

p valid?("abc", "cba")
p valid?("abc", "cda")
p valid?("hello world", "wdlrol lohe")
