#!/usr/bin/ruby
require 'colorize'

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

def chooseWord(words)
    word = ""
    while word.length < 4000
        word = words[rand(words.length)]
    end
    char_array = word.split("")
end

def updateBoard(chars, board, letter)
    counter = 7
    for i in 0..chars.length
        if chars[i] == letter
            if counter % 7 == 0
                board[i] = letter.red.blink
            elsif counter % 7  == 1
                board[i] = letter.blue
            elsif counter % 7 == 2
                board[i] = letter.white.blink
            elsif counter % 7 == 3
                board[i] = letter.yellow
            elsif counter % 7 == 4
                board[i] = letter.light_red
            elsif counter % 7 == 5
                board[i] = letter.light_blue.blink
            elsif counter % 7 == 6
                board[i] = letter.green
            end
            counter += 1
        end
    end
    board.each do |c|
        print "#{c} "
    end
    puts
    return board
end

#/nfs/2017/j/jvishwar/42final/Day07notcloned/words.txt
print "Enter difficult of easy, medium, or hard : "
difficultly = gets.chomp
#print "Please paste absolute file path of the file to read : "
#path = gets.chomp.to_s
path = "/nfs/2017/j/jvishwar/42final/Day07notcloned/words.txt"
words = readFile(path)
#Array of the correct characters of the chosen word
chars = chooseWord(words)
isFull = false
attempt_counter = 0
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
while !isFull
    attempt_counter+=1
    letter = gets.chomp.to_s
    system ("clear")
    board = updateBoard(chars, board, letter)
    if !(board.include? "_")
        isFull = true
    else
        print "Guess another letter: "    
    end
end
puts "Congratulations, you guessed the word correctly in #{attempt_counter} attemps!"