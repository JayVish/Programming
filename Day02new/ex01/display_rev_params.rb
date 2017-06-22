#!/usr/bin/ruby
if(ARGV.length<2)
    puts("none")
else
    i=0;
    words = Array.new
    ARGV.each do |x|
        words[i]=x
        i+=1
    end
    words.reverse!
    words.each {|w| puts w}
end