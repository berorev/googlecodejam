class P2012QRB
  def solve(in_filename, out_filename)
    calculators = []
    File.open(in_filename) do |f_in|
      n_test_case = f_in.gets.strip.to_i

      (1..n_test_case).each do |i_tc|
        in_line = f_in.gets.strip
        tokens = in_line.split(' ')
        tokens.collect! { |token| token.to_i }

        calculator = GooglersCalculator.new(tokens[0], tokens[1], tokens[2], tokens[3, tokens[0]])

        calculators << calculator
      end
    end

    File.open(out_filename, 'w') do |f_out|
      calculators.each_with_index do |calculator, i|
        f_out.puts "Case ##{i+1}: #{calculator.calc}"
      end
    end
  end
end

class GooglersCalculator
  def initialize(n_googlers, n_surprising, lowbound_score, googlers)
    @n_googlers = n_googlers
    @n_surprising = n_surprising
    @lowbound_score = lowbound_score
    @googlers = googlers
    @result = 0
  end

  def calc
    # triplet:
    #   3n     => [(n, n, n), (n-1, n, n+1)(*)]
    #   3n + 1 => [(n, n, n+1), (n-1, n+1, n+1)(*)]
    #   3n + 2 => [(n, n, n+2)(*), (n, n+1, n+1)]
    
    @googlers.each do |g|
      n = (g / 3).floor
      remainder = g % 3
      
      case remainder
      when 0
        if n >= @lowbound_score
          @result += 1
        elsif n > 0 && (n + 1) >= @lowbound_score && @n_surprising > 0
            @result += 1
            @n_surprising -= 1 
        end
      when 1
        @result += 1 if (n + 1) >= @lowbound_score
      when 2
        if (n + 1) >= @lowbound_score
          @result += 1
        elsif (n + 2) >= @lowbound_score && @n_surprising > 0
            @result += 1
            @n_surprising -= 1 
        end
      end
    end
    
    @result
  end

  def to_s
    "n_googlers: #{@n_googlers}, n_surprising: #{@n_surprising}, lowbound_score: #{@lowbound_score}, googlers: #{@googlers}"
  end
end

if $0 == __FILE__
  P2012QRB.new.solve('B-sample.in', 'B-sample.out')
  P2012QRB.new.solve('B-small-practice.in', 'B-small-practice.out')
  P2012QRB.new.solve('B-large-practice.in', 'B-large-practice.out')
end