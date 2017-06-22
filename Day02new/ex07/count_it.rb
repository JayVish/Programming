#!/usr/bin/ruby
puts "parameters: #{ARGV.length}"
ARGV.each do |x|
    puts "#{x}: #{x.length}"
end
