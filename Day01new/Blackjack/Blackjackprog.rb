#!/usr/bin/ruby
hand = ARGV[0]
chars = hand.split("")
counter = 0
points = 0
acecounter=0
while counter<chars.length
    if (chars[counter]=='K' || chars[counter]=='D' || chars[counter]=='J' || chars[counter]=='T')
        points+=10
    elsif chars[counter]=='A'
        acecounter +=1
    else
        points+=(chars[counter]).to_i
    end
    counter=counter+1
end
if(acecounter>4)
    puts "error"
    exit
while(acecounter>0)
    if(21-points>11)
        points+=11
    else
        points+=1
    end
    acecounter=acecounter-1
end
#check
errorcounter=0;
counter=0;

for(num in 2..9)
    while(counter<chars.length)
        if num = chars[counter].to_i
            errorcounter+=1
        end
    end
    if(errorcounter>4)
        puts "error"
        exit
end

puts(points)

