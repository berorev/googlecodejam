class P2012QRC
  def solve(in_filename, out_filename)
    File.open(out_filename, 'w') do |f_out|
      File.open(in_filename) do |f_in|
        n_test_case = f_in.gets.strip.to_i

        (1..n_test_case).each do |i_tc|
          in_line = f_in.gets.strip
          tokens = in_line.split(' ')
          tokens.collect! { |token| token.to_i }

          a, b = tokens[0], tokens[1]
          result = 0

          (a...b).each do |n|
            next if n < 10

            tmp = n.to_s
            buf = { n => true }

            # Elapsed 147886.459ms
            (n.to_s.length - 1).times do
              recycled_str = recycle(tmp)
              buf[recycled_str] = true if !buf.has_key?(recycled_str) && n < recycled_str.to_i && recycled_str.to_i <= b
              tmp = recycled_str
            end

            result += buf.length - 1

            # Elapsed 149519.552ms
            # while (tmp = recycle(tmp)) != n.to_s
            #   result += 1 if n < tmp.to_i && tmp.to_i <= b
            # end
          end

          f_out.puts "Case ##{i_tc}: #{result}"
        end
      end
    end
  end

  private

  def recycle(i)
    i[1..-1] + i[0]
  end

  def recycle_int_version(i)
    digits = i.to_s.length

    pow = 10 ** (digits - 1)

    result = (i % pow) * 10 + (i / pow).floor

    result.to_s.length == digits ? result : -1
  end
end

if $0 == __FILE__
# P2012QRC.new.solve('C-sample.in', 'C-sample.out')
# P2012QRC.new.solve('C-small-practice.in', 'C-small-practice.out')
# P2012QRC.new.solve('C-large-practice.in', 'C-large-practice.out')
end