module GoogleCodeJamHelper
  def GoogleCodeJamHelper.process(in_filenames)
    in_filenames.each do |in_filename|
      out_filename = in_filename[0..in_filename.rindex('.')] + 'out'

      File.open(out_filename, 'w') do |fout|
        File.open(in_filename) do |fin|
          tc_cnt = fin.gets.strip.to_i

          (1..tc_cnt).each do |tc_idx|
            answer = yield(fin)
            fout.puts "Case ##{tc_idx}: #{answer}"
          end
        end
      end
    end
  end
end