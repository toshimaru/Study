
def leap_year?(year)
  if year % 400 == 0 
    return true
  elsif year % 100 == 0 
    return false
  elsif year % 4 == 0 
    return true
  else
    return false
  end
end

begin
  ARGV[0] or raise 'missing year'
  # Integer()は数値表現とは見えない文字列が与えられた場合、
  # #to_iと違い、ArgumentErrorを発生させます。
  y = Integer(ARGV[0])
  y >= 0 or raise "invalid year: #{y}"
  puts "#{y}: #{leap_year?(y)}"
rescue => ex
  # 例外を捕まえて、エラーメッセージと使い方を喋って終わる
  me = File.basename($0, '.rb')
  $stderr.puts "#{me}: #{ex}"
  $stderr.puts "Usage: #{me} YEAR"
end

=begin
def leap_year?(y)
  return false unless y % 4   == 0
  return true  unless y % 100 == 0
  y % 400 == 0
end
=end

# while true
#   puts 'What year?'
#   year = Integer(gets.chomp)
#   p leap_year?(year)
# end