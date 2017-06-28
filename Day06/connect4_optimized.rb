#!/usr/bin/ruby
#Method prints board with correct formatting
def printBoard(board)
    for num in 0...board.length
        print "|"
        for i in 0...board[num].length
            print " #{board[num][i]} "
        end
        print "|"
        puts
    end
    print " "
    for num in 0...board[num].length
        print " #{num+1} "
    end
    puts
end

#Method fills board in correct place
def fillBoard(board, column_number, shape)
    table = board
    piece = shape.to_s
    distance_from_top = 0
    for num in 0...board.length
        if table[num][column_number] != "."
            distance_from_top += 1
        end
    end
    #Subtract 1 because .length will yield 1 more than necessary
    #Basically adding 1 from the bottom for every occupied position
    table[table.length-distance_from_top-1][column_number] = piece
    return table
end 

def checkWin(board, shape, win_condition)
    streak = win_condition.to_i
    piece = shape.to_s
    isWon = false
    #Counts consecutive number of pieces given
    piece_counter_cons = 0

    #Checking win condition for rows
    for num in 0...board.length
        for col in 0...board[num].length
            #If the current piece is correct and the next one also is, increment counter. If we are last element in row, then also increment. 
            #Finally, if we are one away from reaching streak and the current piece is correct, we don't need the next one to be correct.
            if board[num][col] == piece && (col == board[num].length-1 ||  board[num][col+1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons += 1
            else
                piece_counter_cons = 0
            end
            if piece_counter_cons >= streak 
                isWon = true
            end
        end
    end
    piece_counter_cons = 0

   #Checks win condition for columns
    for num in 0...board[0].length
        for col in 0...board.length
            if board[col][num] == piece && (col == board.length-1 ||  board[col+1][num] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons += 1
            else
                piece_counter_cons = 0
            end
            if piece_counter_cons == streak 
                isWon = true
            end
        end
    end
    piece_counter_cons = 0


    #Checks win condition for diagonal going from the left up to the right (Designed for top left triangle)
    for r in 0...board.length
        for c in 0...board[r].length-r
            #Current index = board.length-1. r brings us up by 1 to the next diagonal. c allows us to shift up for one diagonal.
            if board[(board.length-1)-r-c][c] == piece && (board[(board.length-1)-c-r-1][c+1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons += 1
            else
                piece_counter_cons = 0
            end
            if piece_counter_cons >= streak 
                isWon = true
            end
        end
    end

# Diagonal checking. 3 and 4 are right down to upper left
    piece_counter_cons = 0
    piece_counter_cons2 = 0
    piece_counter_cons3 = 0
    piece_counter_cons4 = 0
    for r in 0...board.length
        for c in 0...board[r].length#-r
            #Current index = board.length-1. r brings us up by 1 to the next diagonal. c allows us to shift up for one diagonal.
            if board[(board.length-1)-c][c+r] == piece && (board[(board.length-1)-c-1][c+r+1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons += 1
            else
                piece_counter_cons = 0
            end
            if board[(board.length-1)-r-c][(board[0].length-1)-c] == piece && (c == board[0].length-r-1 || board[(board.length-1)-c-r-1][(board[r].length-1)-c-1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons2 += 1
            else 
                piece_counter_cons2 = 0
            end            
            if board[(board.length-1)-r-c][(board[0].length-1)-c] == piece && (c == board[0].length-r-1 || board[(board.length-1)-c-r-1][(board[r].length-1)-c-1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons3 += 1
            else 
                piece_counter_cons3 = 0
            end
            if board[(board.length-1)-c][(board[0].length-1)-r-c] == piece && (c == board[0].length-r-1 || board[(board.length-1)-c-1][(board[r].length-1)-r-c-1] == piece || piece_counter_cons == streak - 1)
                piece_counter_cons4 += 1
            else 
                piece_counter_cons4 = 0
            end
            if piece_counter_cons >= streak ||  piece_counter_cons2 >= streak || piece_counter_cons3 >= streak || piece_counter_cons4 >= streak 
                isWon = true
            end
        end
    end

return isWon
end

isWon = false
which_player = "x"
column_number = 0
print "Number of rows (Default is 6) : "
rows = gets.chomp.to_i
print "Number of columns (Default is 7) : "
columns = gets.chomp.to_i
print "Number of pieces needed to be placed in a row to win (Default is 4): "
streak = gets.chomp.to_i
board = Array.new(rows) {Array.new(columns, ".")}
puts "=== *Connect 4* ==="
printBoard(board)
while !isWon
    print "Player #{which_player.upcase}, enter a column number to drop your piece: "
    #Subtract 1 to account for the index starting at 0
    column_number = gets.chomp.to_i-1
    board = fillBoard(board, column_number, which_player)
    #Swaps the piece between x and o
    puts "\nPlayer #{which_player.upcase} drops a piece on column #{column_number+1}."
    printBoard(board)
    isWon = checkWin(board, which_player, streak)
    if isWon
        puts "Player #{which_player.upcase} has just gotten #{streak} in a row!\nGame Over."
    else
        which_player == "x" ? which_player = "o" : which_player = "x"
    end
end
