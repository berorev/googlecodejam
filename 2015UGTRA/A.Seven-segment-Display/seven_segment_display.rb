require_relative '../../google_code_jam_helper.rb'

class SevenSegmentDisplay
  include GoogleCodeJamHelper

  def initialize
    @expects = [
      '1111110',
      '0110000',
      '1101101',
      '1111001',
      '0110011',
      '1011011',
      '1011111',
      '1110000',
      '1111111',
      '1111011',
    ]
  end

  def run(in_filenames)
    GoogleCodeJamHelper.process(in_filenames) do |fin|
      # parse input
      token = fin.gets.strip.split(/ /)
      n = token[0].to_i
      strs = token.drop(1)
      
      sols = []
      
      (0..9).reverse_each do |i|
        
        first_diff = -1
        has_error = false
        n.times do |j|
          real = strs[j].to_i(2)
          expect = @expects[(i + 10 * n - j) % 10].to_i(2)
          
          reduce = expect & real
          diff = expect ^ real
          
          first_diff = diff if first_diff < 0
          if reduce == real && first_diff == diff
            next
          else
            has_error = true
            break
          end
        end
        
        sols << @expects[(i + 10 - 1) % 10] if !has_error
      end
      
      sols.length == 1 ? sols[0] : 'ERROR!'
    end
  end

  def solve
  end
end

if $0 == __FILE__
  SevenSegmentDisplay.new.run(%w(A-sample.in)) 
end