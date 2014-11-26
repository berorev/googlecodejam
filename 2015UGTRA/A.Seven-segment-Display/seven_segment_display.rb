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
        
        mask = 0
        
        n.times do |j|
          real = strs[j]
          expect = @expects[(i - j) % 10]
        
          mask_str = ''  
          7.times do |k|
            mask_str << ((expect[k] == '1' && real[k] == '0') ? '1' : '0')
          end
          
          mask |= mask_str.to_i(2)
        end
        
        has_error = false
        n.times do |j|
          real = strs[j].to_i(2)
          expect = @expects[(i - j) % 10].to_i(2)
          
          if turn_off(expect, mask).to_i(2) != real
            has_error = true
            break
          end
        end
        
        sols << turn_off(@expects[(i - n) % 10].to_i(2), mask) if !has_error
      end
      
      sols.length == 1 ? sols[0] : 'ERROR!'
    end
  end
  
  def turn_off(val, mask)
    (val & (mask ^ '1111111'.to_i(2))).to_s(2).rjust(7, '0')
  end
end

if $0 == __FILE__
  SevenSegmentDisplay.new.run(%w(A-sample.in A-small-practice.in A-large-practice.in)) 
end