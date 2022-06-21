class Game
    private
    def self.shuffle
        @@colors = ["red", "green", "yellow", "blue", "orange", "white"]
        @@color_shuffled = []
        
        #@@color_shuffled = @@colors.shuffle
        #temporary = @@colors.shuffle[0]

        #while @@color_shuffled.length > 4
            #@@color_shuffled.pop
        #end
        while @@color_shuffled.length < 4
            @@color_shuffled.push(@@colors.shuffle[0])
        end
    end

    def self.check_if_winner(hints)
        correct_hints = ["o", "o", "o", "o"]
        if hints == correct_hints
            return true
        else
            return false
        end
    end
    def self.generate_hints(choices, isHuman)
        @@hints = []
        

        if isHuman == true
            temp = []
            @@color_shuffled.each do |value|
                temp.push(value)
            end
            puts "tempo: "
            p temp
            puts 'shuffled code: '
            p self.get_shuffled
            for i in 0..3
                for y in 0..3
                    case choices[i] 

                    when self.get_shuffled_pos(y)
                        if i == y
                            @@hints.push('o')
                            choices[i] = 'replace'
                            self.set_shuffled_code(i)
                            break
                            
                        else
                            @@hints.push('x')
                            choices[i] = 'replace'
                            #@@player_code[i] = 'unset'
                            self.set_shuffled_code(i)
                            break
                            
                        end
                    end
                end
            end
            puts 'hints: '
            p @@hints.shuffle
            @@color_shuffled = temp

        elsif isHuman == false
            temp = []
            @@player_code.each do |value|
                temp.push(value)
            end
            puts "tempo: "
            p temp
            puts 'player code: '
            p self.get_player_code
            for i in 0..3
                for y in 0..3
                    case choices[i] 

                    when self.get_player_code_pos(y)
                        if i == y
                            @@hints.push('o')
                            choices[i] = 'replace'
                            self.set_player_code(i)
                            break
                            
                        else
                            @@hints.push('x')
                            choices[i] = 'replace'
                            #@@player_code[i] = 'unset'
                            self.set_player_code(i)
                            break
                            
                        end
                    end
                end
            end
            puts 'hints: '
            p @@hints.shuffle
            @@player_code = temp
        end
        
    end



    def self.computer_solver(hints, game_turns)
        computer_code_array = ["red", "green", "yellow", "blue", "orange", "white"]
        a = ["red", "green", "yellow", "blue", "orange", "white"]
        b = a.repeated_permutation(4).to_a
        
        b.each_with_index do | numbers, index |
            p "#{index}: #{numbers}"
        end
        p b.shuffle.first
        #if hints == nil
        
        
    end

    def self.set_player_code(x)
        @@player_code[x] = 'unset'
    end
    def self.set_shuffled_code(x)
        @@color_shuffled[x] = 'unset'
    end
    public
    

    def self.get_hints
        @@hints
    end
    def self.start_as_codemaker

        game_turns = 1
        puts "\n\nWhen the game prompts you, enter the color 'red', 'green', 'yellow', 'blue', 'orange', or 'white' into the corresponding position for your code"
        @@player_code = []
        length = 0 
        #self.generate_hints(player_choice)
        while length != 4
            @@player_code.push(self.take_code)
            p @@player_code
            length += 1
        end
        print "Your code is: "
        p @@player_code
        print "\n\n\n"

        #self.computer_solver(self.get_hints, player_choice)
        print "\n------Hint instructions-----\n"
        print "x means a color is correct but is in the wrong position\n"
        print "o means a color is correct and is in the correct position\n"
        print "--------------------------\n"
        while game_turns <= 12
            computer_choice = []
            puts "------\nRound: #{game_turns}"
            length = 0 
            #while length != 4
                #computer_choice.push(self.take_code)
                #p computer_choice

                #length += 1
            #end
            #computer_choice = ['red', 'red', 'red', 'red']
            #puts 'computer choice: '
            self.shuffle
            computer_choice = self.get_shuffled
            p computer_choice
            
            self.generate_hints(computer_choice, false)
            if self.check_if_winner(self.get_hints)
                p "You have guessed the code!"
                break
            else
                game_turns += 1
            end
            
        end

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
            puts 'player choices: '
            #p self.get_shuffled
            p player_choice
            self.generate_hints(player_choice, true)
            if self.check_if_winner(self.get_hints)
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
    def self.get_player_code_pos(x)
        @@player_code[x]
    end
    def self.get_player_code
        @@player_code
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
    elsif choice == 2
        self.start_as_codemaker
    end
    
end

g = Game.new
g



=begin
# if human

for i in 0..3
                for y in 0..3
                    case choices[i] 

                    when self.get_shuffled_pos(y)
                        if i == y
                            @@hints.push('o')
                            break
                            
                        else
                            @@hints.push('x')
                            break
                            
                        end
                    end
                end
            end

#if computer
        elsif isHuman == false
            p self.get_player_code
            index_of_choices = [0,1,2,3]
            for i in 0..3
                index_of_choices.each do | index |
                    case choices[i]
                        
                    when self.get_player_code_pos(index)
                        if i == index
                            @@hints.push('o')
                            index_of_choices.pop
                        end
                    end
                end
            end

=end
=begin
p self.get_player_code
            for i in 0..3
                for y in 0..3
                    case choices[i] 

                    when self.get_player_code_pos(y)
                        if i == y
                            @@hints.push('o')
                            break
                            
                        else
                            @@hints.push('x')
                            break
                            
                        end
                    end
                end
            end
            p @@hints.shuffle
=end