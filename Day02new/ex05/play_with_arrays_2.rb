#!/usr/bin/ruby
org = [2, 8, 9, 48, 8, 22, -12, 2]
final = Array.new
org.each do |x|
    if x>5 
        final<<x+2
    end
end
p org
p final