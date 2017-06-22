#!/usr/bin/ruby
def layercounter(x)
    layers = 0
    val = Integer(x)
    for repeat in 1...val+1
        for num in 1..repeat+2
            layers+=1
        end
    end
    puts layers
end

def sigma(layerval)
    sum=0
    for num in 1..layercounter(layerval)
        sum+=1+num*2
    end 
    for i in 1..layerval
        sum+=6
    end
    return sum
end

layercounter(ARGV[0])

=begin
if(ARGV[0]==0)
    puts
else
    layercounter=6
end


#max layer is 71 -2 each one for first
#first part of door starts at 31

leftspace=""
center = ARGV[0]
#1,4 5,36 2, 10
#+6 characters each layer
charcounter_bottomlayer = 3+6*sigma
36.time
for num in 0...5
    print "#{leftspace}/"
    for i in 0..69-num*2
        print "*"
    end
    print "\\"        
    leftspace -= " "
    puts
end
=end
