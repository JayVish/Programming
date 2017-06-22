#!/usr/bin/ruby
def great_births(people)
    data = people.sort_by {|x,y| y[:year_of_birth]}
    data.each do |person, info|
            puts "#{info[:name]} is a great person born #{info[:year_of_birth]}"   
    end
end

women_in_science = {
    :ada => { :name => "Ada Lovelace", :year_of_birth => "1815" },
    :cecilia => { :name => "Cecila Payne", :year_of_birth => "1900" },
    :lise => { :name => "Lise Meitner", :year_of_birth => "1878" },
    :grace => { :name => "Grace Hopper", :year_of_birth => "1906" }
}

great_births women_in_science