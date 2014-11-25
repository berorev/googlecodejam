n = 24

(0..9).reverse_each do |i|
  n.times do |j|
    print (i - j) % 10 # (i + ((n % 10) * 10) - j) % 10
    print ', '
  end
  puts " => #{(i - n) % 10}"
end

a = '111'.to_i(2)
b = '100'.to_i(2)
puts (a ^ b).to_s(2)
puts ('1111'.to_i(2) & ('0100'.to_i(2) ^ '1111'.to_i(2))).to_s(2)
