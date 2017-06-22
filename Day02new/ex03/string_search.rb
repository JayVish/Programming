#!/usr/bin/ruby
zstring=""
if(ARGV.length==1)
    chars = ARGV[0].split("")
    chars.each do |x|
        if(x=='z')
            zstring = zstring+"z"
        end
    end
    puts zstring
else
    puts "none"
end
