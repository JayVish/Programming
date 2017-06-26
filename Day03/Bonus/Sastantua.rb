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
	return values
end

def printPyramid(values, x)
	pyramid_height = x.to_i
	center_star = values[values.length-1]/2+1
	gap_right = 1
	left_space = ""
	(center_star-1).times do |z|
		left_space += " " 
	end
	door_star_counter = 0
	if pyramid_height%2!=0
		door_star = pyramid_height/2
	else
		door_star = pyramid_height/2
		gap_right=2
	end
	puts door_star
	for num in 1..values.length
		print "#{left_space}"
		print "/"
		if num > values.length-pyramid_height
			for i in 0...values[num-1]
				if door_star_counter >= ((values[num-1]/2+1)-door_star-1) && door_star_counter <= ((values[num-1]/2+1)+door_star-gap_right)
					if pyramid_height>2 && num.to_f == (values.length-pyramid_height/2).round && door_star_counter >= (values[num-1]/2+1)-door_star-gap_right-1 && door_star_counter <= (values[num-1]/2+1)+door_star-gap_right-1
						print "$"
					else
						print "|"
					end
				else
					print "*"
				end
				door_star_counter+=1
			end
		else	
			for i in 0...values[num-1]
				print "*"
			end
		end
		print "\\"
		#Left_space value setting
		left_space = ""
		if num!=values.length
			(center_star-(values[num]/2+1)).times do |y|
				left_space += " " 
			end
		end
		door_star_counter = 0
		puts
	end
end

printPyramid(storeValues(ARGV[0]), ARGV[0])
