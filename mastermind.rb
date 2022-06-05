class Game
    private
    def self.shuffle
        @@colors = ["red", "green", "yellow", "blue", "orange", "white"]
        @@color_shuffled = []
    
        @@color_shuffled = @@colors.shuffle

        while @@color_shuffled.length > 4
            @@color_shuffled.pop
        end
    end
    public
    def self.start_as_decoder
        game_turns = 1
        
        while game_turns <= 12
            puts game_turns

            game_turns += 1
        end
    end 
    def self.get_shuffled
        @@color_shuffled
    end
    choice = 0
    while choice > 3 || choice <= 0
        print "[1] Be the Decoder\n"
        print "[2] Create the code\n"
        print "[3] Exit\n"
        print "Enter your choice: "
        choice = gets.chomp.to_i
    end

    if choice == 1
        self.shuffle
        p self.get_shuffled
        self.start_as_decoder
    end
    
end

g = Game.new
g