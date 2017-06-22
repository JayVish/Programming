#!/usr/bin/ruby
print "Please tell me your age: "
age = Integer(gets.chomp)
puts ("In 10 years, you'll be #{age+10} years old.")
puts ("In 20 years, you'll be #{age+20} years old.")
puts ("In 30 years, you'll be #{age+30} years old.")

=begin
i = 10
loop do
    if (i<=30)
        puts ("In #{i} years, you'll be #{age+i} years old.")
        i += 10
    else
        end
end
=end
