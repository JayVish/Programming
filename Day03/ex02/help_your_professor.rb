#!/usr/bin/ruby
def average_mark(grades)
    total_pts = 0
    grades.each do |name, mark|
        total_pts+=mark
    end
    return total_pts/grades.size
end

class_01 = {
    "margot" => 18,
    "jenny" => 8,
    "billy" => 14
}

class_02 = {
    "bob" => 16,
    "the" => 20,
    "builder" => 17
}

puts "Average mark for class 01: #{average_mark class_01}"
puts "Average mark for class 02: #{average_mark class_02}"