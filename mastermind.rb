class Game
    game_turns = 1
    colors = ["red", "green", "yellow", "blue", "orange", "white"]
    color_shuffled = []

    color_shuffled = colors.shuffle
    while color_shuffled.length > 4
        color_shuffled.pop
    end


    p color_shuffled
    
    while game_turns <= 12
        puts game_turns

        game_turns += 1
    end 
end

g = Game.new
g