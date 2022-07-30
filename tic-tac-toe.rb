board = [
    ["   ", "|", "   ", "|", "   ", "\n"],
    ["---", "+", "---", "+", "---", "\n"],
    ["   ", "|", "   ", "|", "   ", "\n"],
    ["---", "+", "---", "+", "---", "\n"],
    ["   ", "|", "   ", "|", "   ", "\n"],
]

def print_board (array)
    board = array.join
    puts board
end

print_board(board)