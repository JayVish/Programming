#!/usr/bin/ruby
def returnBinaryArray(digit_string, str_array_digits, value_to_achieve)
    digit_array = str_array_digits.map(&:to_i)
    correct_combinations = Array.new {Array.new}
    hold = []
    sum = 0
    0.upto(2**digit_array.length-1).each do |n| 
        x = sprintf("%0*b", digit_string.to_s.length, n)
        hold.push(x)
    end
    for i in 0...hold.length
        for str_counter in 0...hold[i].length
            if hold[i][str_counter] == "0"
                sum += digit_array[str_counter]
            else
                sum -= digit_array[str_counter]
            end
        end
        if sum == value_to_achieve
            correct_combinations.push(hold[i])
        end
        sum = 0
    end
    return correct_combinations
end 

str_array_digits = ARGV[0].split("")
value_to_achieve = ARGV[1].to_i
correct_combinations = Array.new {Array.new}
digits = str_array_digits.map(&:to_i)
correct_combinations = returnBinaryArray(ARGV[0], digits, value_to_achieve)
for r in 0...correct_combinations.length
    for str_counter in 0...correct_combinations[r].length
        if correct_combinations[r][str_counter] == "0"
            print "+ #{digits[str_counter]} "
        else
            print "- #{digits[str_counter]} "
        end
    end
    print "= #{value_to_achieve}\n"
end

=begin
1234
1 + 234
1 + 2 + 34
1 + 23 + 4
12 + 3 + 4
12 + 34
123 + 4
1234

1 + 23 + 4
1 + 234

1 + 2 + 34
12 + 34

12345
12345
12 + 345
1
=end
