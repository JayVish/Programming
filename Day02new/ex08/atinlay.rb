#!/usr/bin/ruby
unless(ARGV)
    puts "none"
end
values = ARGV
vowelhit = false
counter = 0
values.map! do |word|
    word.downcase
    counter=0
    vowelhit=false
    if word.start_with?("a", "e", "i", "o", "u")
        word=word+"way"
    else
        while vowelhit==false && counter<word.length-1
            if word[counter]=="a" || word[counter]=="e" || word[counter]=="i" || word[counter]=="o" || word[counter]=="u"
                vowelhit=true
            else
                counter+=1
            end 
        end
        #stoic counter 2
        word = "#{word}#{word[0...counter]}ay"
        word = word[counter...word.length]
    end
end

values.each do |pig|
    puts pig.downcase
end