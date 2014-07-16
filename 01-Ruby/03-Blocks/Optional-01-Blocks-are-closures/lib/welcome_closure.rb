def block_counter
  n = 0
  return Proc.new { n = n + 1 }
end

b = block_counter
puts b.call
n = 10
puts b.call

count = -1

welcome_blk = Proc.new do |name|
  # your code goes here !
  count += 1
  if count > 1
    puts "Welcome " + name + ", join your #{count} friends"
  else

    puts "Welcome " + name + ", join your #{count} friend"
  end

end

puts welcome_blk.call("felix") # => Welcome felix, join your 0 friend
puts welcome_blk.call("estelle") # => Welcome estelle, join your 1 friend
puts welcome_blk.call("cedric") # => Welcome estelle, join your 2 friends
puts welcome_blk.call("fred") # => Welcome fred, join your 3 friends
print "#{count}"