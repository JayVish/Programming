#!/usr/bin/ruby
print "What you gotta say?: "
end_loop = false
while !end_loop
    input = gets.chomp
    if input=="STOP!"
        end_loop = true
    else
        print "I got that! Anything else?: "
    end
end
