#!/usr/bin/ruby
if(ARGV.length==2 && ARGV[1].scan(ARGV[0]).count > 0)
    puts ARGV[1].scan(/(?=#{ARGV[0]})/).count
else
    puts "none"
end
