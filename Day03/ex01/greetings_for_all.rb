#!/usr/bin/ruby
def greet(name = "Hello, noble stranger")
    if(name.is_a? Numeric)
        puts "Error! That doesn't sound like a name."
    else
        puts "Hello, #{name}."
    end
end

greet("lucie")
greet()
greet(22)
