#!/usr/bin/ruby
def layercounter(x)
    layers = 0
    val = x.to_i
    for repeat in 1...val+1
        for num in 1..repeat+2
            layers+=1
        end
    end
    return layers
end

#star only count
#5 13 23 35

#model cubic func
#5 17 31 49
#first 12 15 18
#second 3 3 3

#4 9 15
def sigma(layerval)
    sum=1
	val=(layercounter(layerval))
    for num in 1...val
        sum+=2
    end

	if layerval.to_i > 1
		#sum+=3*(layerval.to_i+2)
		change=0
		counter=0
		for i in 1...layerval.to_i
			layer_height = i+2
			if layer_height%2==1
				counter+=1
				change = 3+counter-2
			else
				change = 3+counter-2
			end
			sum+=change*2
			layer_height=0
			change=0
		end
	end

#    for i in 1...layerval.to_i
#       sum+=6
#   end
    puts sum
end

def storeValues(x)
	layer_count=x.to_i
	values=[]
	counter_height=3
	star_sum = 1
	counter_change = 0
	for l in 1..layer_count
		if l==1
			values.push(star_sum)
		end
		for r in 1...counter_height
			star_sum+=2
			values.push(star_sum)
		end
		if counter_height%2==1
			counter_change+=1
			star_sum += 2*(3+counter_change-1)
		else
			star_sum += 2*(3+counter_change-1)
		end	
		if l!=layer_count
			values.push(star_sum)
		end
		counter_height+=1
	end
	p values
end

storeValues(ARGV[0])

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
