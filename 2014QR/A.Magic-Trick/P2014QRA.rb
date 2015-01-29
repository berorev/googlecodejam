require '../../google_code_jam_helper.rb'

class P2014QRA
  include GoogleCodeJamHelper

  def run(in_filenames)
    GoogleCodeJamHelper.process(in_filenames) do |fin|
      data_group = []
      (0..1).each do |i|
        data_group[i] = []
        data_group[i] << fin.gets.strip # answer (which rows)
        data_group[i] << []
        4.times do # card arrangement
          data_group[i].last << fin.gets.strip.split(/ /)
        end
      end

      candidate1 = get_candidate_cards(data_group[0])
      candidate2 = get_candidate_cards(data_group[1])
      
      intersect = candidate1 & candidate2

      if intersect.empty?
        'Volunteer cheated!'
      elsif intersect.length == 1
        intersect.first
      else
        'Bad magician!'
      end
    end
  end

  def get_candidate_cards(data)
    answer_row = data[0]
    card_arr = data[1]
    
    card_arr[answer_row.to_i - 1]
  end
end

if $0 == __FILE__
  P2014QRA.new.run(%w(A-sample.in A-small-practice.in)) 
end