require 'colorize'
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
    def self.check_if_winner(hints)
        correct_hints = ["o", "o", "o", "o"]
        if hints == correct_hints
            return true
        else
            return false
        end
    end
    def self.start_as_codemaker
        puts "\n\nWhen the game prompts you, enter the color 'red', 'green', 'yellow', 'blue', 'orange', or 'white' into the corresponding position for your code"

    end
    def self.take_code
        prompt = "Input here: "
        print prompt
        while user_input = gets.chomp
            case user_input
            when "red"
                return "red"
            when "green"
                return "green"
            when "yellow"
                return "yellow"
            when "blue"
                return "blue"
            when "orange"
                return "orange"
            when "white"
                return "white"
            else
                puts "Invalid input try again."
                #p player_choice
                print prompt
            end
            
        end
        
    end
    def self.start_as_decoder
        game_turns = 1
        puts "\n\nWhen the game prompts you, enter the color 'red', 'green', 'yellow', 'blue', 'orange', or 'white' into the corresponding position"
        puts "12 ROUNDS ONLY"
        while game_turns <= 12
            player_choice = []
            puts "Round: #{game_turns}"
            #puts game_turns
            prompt = "Input here: "
            #print prompt
            #
            length = 0 
            while length != 4
                player_choice.push(self.take_code)
                p player_choice
                length += 1
            end
            p self.get_shuffled
            hints = []
            print "\n------Hint instructions-----\n"
            print "x means a color is correct but is in the wrong position\n"
            print "o means a color is correct and is in the correct position\n"
            print "--------------------------\n"
            for i in 0..3
                for y in 0..3
                    case player_choice[i] 

                    when self.get_shuffled_pos(y)
                        if i == y
                            hints.push('o')
                            
                        else
                            hints.push('x')
                            
                        end
                    end
                end
            end
            p hints.shuffle
            if self.check_if_winner(hints)
                p "You have guessed the code!"
                break
            else
                game_turns += 1
            end
            
        end
        
    end 
    def self.get_shuffled
        @@color_shuffled
    end

    def self.get_shuffled_pos(x)
        @@color_shuffled[x]
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

=begin
    
                while user_input = gets.chomp
                    case user_input
                    when "red"
                        player_choice.push("red")
                        p player_choice
                        length += 1
                        break
                    when "green"
                        player_choice.push("green")
                        p player_choice
                        length += 1
                        break
                    when "yellow"
                        player_choice.push("yellow")
                        p player_choice
                        length += 1
                        break
                    when "blue"
                        player_choice.push("blue")
                        p player_choice
                        length += 1
                        break
                    when "orange"
                        player_choice.push("orange")
                        p player_choice
                        length += 1
                        break
                    when "white"
                        player_choice.push("white")
                        p player_choice
                        length += 1
                        break
                    else
                        puts "Invalid input try again."
                        p player_choice
                        print prompt
                    end
                    
                end
=end