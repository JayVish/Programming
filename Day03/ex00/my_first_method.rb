#!/usr/bin/ruby
def toUpperCase(word)
    if word.length > 10
        puts word.upcase
    end
end

if ARGV.length==1
    toUpperCase(ARGV[0])
else
    puts "none"
end

