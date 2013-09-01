require '../../google_code_jam.rb'

if $0 == __FILE__
  GoogleCodeJam.new(%w(A-sample.in A-small-practice.in A-large-practice.in)).solve do |in_line|
    month_per_year, day_per_month, day_per_week = in_line.split(' ').collect { |token| token.to_i }
  
    day_per_year = day_per_month * month_per_year
    
    result = Rational(day_per_year, day_per_week).ceil
    result += (month_per_year - 1)
    # My Solution
    result -= Rational((day_per_year - 1), day_per_week.lcm(day_per_month)).floor
    # Google's Solution
    # result -= Rational((month_per_year - 1), (day_per_week / day_per_month.gcd(day_per_week))).floor
  end
end