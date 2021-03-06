class Board

    attr_accessor :cells, :human

    def initialize
        self.reset!
    end

    def reset! 
        @cells = []
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        @cells[input.to_i - 1]
    end

    def full?
        @cells.include?(" ") ? false : true 
    end
    
    def turn_count 
        turn = @cells.reject { |e| e == " "  }
        turn.count
        # binding.pry
    end 

    def taken?(input)
        position(input) != " " ? true : false
    end 

    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input.to_i)
    end

    def update(input, player) 
        @cells[input.to_i - 1] = player.token
    end 
end