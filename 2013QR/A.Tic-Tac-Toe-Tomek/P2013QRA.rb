require '../../google_code_jam_helper.rb'

class P2013QRA
  include GoogleCodeJamHelper
  
  def run(in_filenames)
    GoogleCodeJamHelper.process(in_filenames) do |fin|
      in_line = fin.gets.strip
    end
  end
end

if $0 == __FILE__
  P2013QRA.new.run(%w(A-sample.in A-small-practice.in A-large-practice.in))
end