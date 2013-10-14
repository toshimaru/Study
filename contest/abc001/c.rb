direction, power = gets.split(" ").map(&:to_i)

def getDirection(d)
    d = d / 10.0
    case d
    when 11.25..33.74;   'NNE'
    when 33.75..56.24;   'NE'
    when 56.25..78.74;   'ENE'
    when 78.75..101.24;  'E'
    when 101.25..123.74; 'ESE'
    when 123.75..146.24; 'SE'
    when 146.25..168.74; 'SSE'
    when 168.75..191.24; 'S'
    when 191.25..213.74; 'SSW'
    when 213.75..236.24; 'SW'
    when 236.25..258.74; 'WSW'
    when 258.75..281.24; 'W'
    when 281.25..303.74; 'WNW'
    when 303.75..326.24; 'NW'
    when 326.25..348.75; 'NNW'
    else 'N'
    end
end

def getPower(p)
    p = (p / 60.0).round(1)
    case p
    when 0.0 .. 0.2 ;  0
    when 0.3 .. 1.5 ;  1
    when 1.6 .. 3.3 ;  2
    when 3.4 .. 5.4 ;  3
    when 5.5 .. 7.9 ;  4
    when 8.0 .. 10.7;  5
    when 10.8 .. 13.8; 6
    when 13.9 .. 17.1; 7
    when 17.2 .. 20.7; 8
    when 20.8 .. 24.4; 9
    when 24.5 .. 28.4; 10
    when 28.5 .. 32.6; 11
    else               12  # p > 32.7
    end
end

p = getPower(power)
d = p == 0 ? 'C' : getDirection(direction)
puts "#{d} #{p}"

# def getPower des
#   winds = [0.2, 1.5, 3.3, 5.4, 7.9, 10.7, 13.8, 17.1, 20.7, 24.4, 28.4, 32.6, 12001]
#   m_s = (des / 60.0).round(1)
#   winds.index{|w| m_s <= w}
# end
