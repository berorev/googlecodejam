require 'json'

class P2012QRA
  def solve
    load_dic if @googlerese_dic == nil 

    File.open('A-small.out', 'w') do |fout|
      File.open('A-small.in') do |fin|
        n_test_case = fin.gets.strip.to_i
        
        (1..n_test_case).each do |i_tc|
          in_line = fin.gets.strip
          fout.puts "Case ##{i_tc}: #{translate(in_line)}"
        end
      end
    end
  end
  
  private
  def load_dic
    json_dic = IO.read('A-googlerese.txt').strip
    
    if json_dic.empty?
      @googlerese_dic = make_dic
    else
      @googlerese_dic = JSON.parse(json_dic)
    end
  end
  
  def make_dic
    googlerese_dic = {}
    File.open('A-sample.out') do |fout|
      File.open('A-sample.in') do |fin|
        n_test_case = fin.gets.strip.to_i

        (1..n_test_case).each do |i_tc|
          in_line = fin.gets.strip
          out_line = fout.gets.strip["Case ##{i_tc}: ".length..-1]

          (0...in_line.length).each do |i_in|
            googlerese_dic[in_line[i_in]] = out_line[i_in] # if in_line[i_in] != ' '
          end
        end
      end
    end
    
    googlerese_dic['q'] = 'z'
    googlerese_dic['z'] = 'q'

    File.open('A-googlerese.txt', 'w') do |fdic|
      fdic.puts googlerese_dic.to_json
    end
    
    googlerese_dic
  end
  
  def translate(orig_str)
    trans_str = ''
    (0...orig_str.length).each do |i|
      trans_str << @googlerese_dic[orig_str[i]]
    end
    trans_str
  end
end

if $0 == __FILE__
  P2012QRA.new.solve
end