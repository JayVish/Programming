#!/usr/bin/ruby
def sumArray(a)
    sum = 0
    for num in 0...a.length
        sum += a[num].to_i
    end
    return sum
end
test = Array.new {Array.new}
firstelement = true
counter = 0
=begin
for num in 0...5
    if firstelement
        test.push(test.push([1]))
        firstelement = false
    else
        test[counter - 1].push(test.push([2]))
    end
    counter += 1
end
=end
test.push(["11", "22", "33", "44"])
puts sumArray(test[0])
#print sumArray(test)