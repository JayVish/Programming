#!/usr/bin/ruby
require 'open-uri'

def readFile(path)
    words = []
    word_array = []
    File.open("#{path}", "r") do |f|
        f.each_line do |line|
            #words.push(line.gsub(/\s+/m, ' ').strip.split(" "))
            words.push(line.split(" "))
        end
    end
    for num in 0...words.length
        for i in 0...words[num].length
            word_array.push(words[num][i])
        end
    end
    return word_array
end

def chooseWord(words, x)
    word = ""
    difficultly = x.to_i
    while word.length != difficultly
        word = words[rand(words.length)]
    end
    char_array = word.split("")
end

def updateBoard(chars, board, letter)
    counter = 7
    for i in 0..chars.length
        if chars[i] == letter
                board[i] = letter
        end
    end
    board.each do |c|
        print "#{c} "
    end
    return board
end
=begin
def printHangman(life_counter)
    s = "___________\n|         |\n|         0\n|        /|\\\n|        / \\\n|\n|"
    if life_counter == 6
        puts "___________\n|         |\n|         \n|        \n|        \n|\n|"
    elsif life_counter == 5

puts s
end
=end
input = false
while !input 
    print "Enter the length of the word you would like to look for (Cannot be more than 30) : "
    difficultly = gets.chomp
    if !/\A\d+\z/.match(difficultly) && difficultly < 30
        puts "Invalid difficulty level. Try again."
    else
        input = true
    end
end
system ("clear")
#print "Please paste absolute file path of the file to read : "
#path = gets.chomp.to_s
path = "/nfs/2017/j/jvishwar/42final/Day07notcloned/words.txt"
words = readFile(path)
#Array of the correct characters of the chosen word
chars = chooseWord(words, difficultly)
isFull = false
life_counter = 6
board = []
letters_guessed = []

for n in 0...chars.length
    board.push("_")
end
puts

chars.length.times do |x|
    print "_ "
end
print  "Guess a letter: "
while !isFull || life_counter == 0
    letter = gets.chomp.to_s
    if letter.length != 1 || !letter.match(/^[[:alpha:]]$/)
        print "Invalid. Try again: "
        next
    end
    letter.downcase!
    if letters_guessed.include? letter
        print "Already guessed this letter. Try again: "
        next
    end
    puts
    letters_guessed.push(letter)
    life_counter -= 1
    if life_counter == 0
        break
    end
    system ("clear")
    print "Letters guessed: "
    letters_guessed.each do |x|
        print "#{x} "
    end
    puts "\nLives left: #{life_counter}"
    puts 
    board = updateBoard(chars, board, letter)
    if !(board.include? "_")
        isFull = true
    else
        print "Guess another letter: "    
    end
end
if life_counter > 0
    puts "Congratulations, you guessed the word correctly with #{life_counter} lives left!"
else
    puts "You are a failure! The correct answer was: "
    chars.each do |x|
        print "#{x}"
    end
    puts
end