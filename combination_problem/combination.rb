#!/usr/bin/ruby
#Checking addition of single digits combinations
def sumArray(a)
    sum = 0
    for num in 0...a.length
        sum += a[num].to_i
    end
    return sum
end

str_array_digits = ARGV[0].split("")
value_to_achieve = ARGV[1].to_i
correct_combinations = Array.new {Array.new}
store = ""
digits = str_array_digits.map(&:to_i)
sum = 0
for i in 0...digits.length
    hold = digits.combination(i+1).to_a
    #Loops through each possible combination at whatever number i is at + 1
    for x in 0...hold.length
        sum = sumArray(hold[x])
        if sum == value_to_achieve
            correct_combinations.push(hold[x])
        end
    end
end
p correct_combinations
