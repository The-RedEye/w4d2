require_relative "slideable.rb"
require_relative "steppable.rb"
require "singleton"

class Piece
    attr_reader :pos, :color, :board
    attr_writer :pos
    def initialize(pos, color, board)
        @pos = pos
        @color = color
        @board = board
    end

    # def moves # add validation function
    # end

end # End Piece Class


# -----------------------

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = " "
        @color = :none
    end

    def empty?
        true
    end

    def moves
        []
    end
    
end #End NullPiece Class


#---------------------------

class Rook < Piece
    attr_reader :symbol
    include Slideable
    def initialize(pos, color, board)
        @symbol = :rook
        super 
    end

    def move_dirs
        horizontal_dirs
    end


end

class Bishop < Piece
    include Slideable

    def initialize(pos, color, board)
        @symbol = :bishop
        super
    end

    def move_dirs
        diagonal_dirs
    end
end

class Queen < Piece
    include Slideable

    def initialize(pos, color, board)
        @symbol = :queen
        super
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

end

class Knight < Piece
    include Steppable

    def move_diffs 
        [
        [2, 1],
        [-2,1],
        [2,-1],
        [-2,-1],
        [1,2],
        [-1,2],
        [1,-2],
        [-1,-2]
        ]
    end

    def initialize(pos, color, board)
        @symbol = :knight
        super
    end


end

class King < Piece
    include Steppable

    def move_diffs 
        [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0],
        [1,1],
        [-1,1],
        [-1,-1],
        [1,-1]
        ]
    end

    def initialize(pos, color, board)
        @symbol = :king
        super
    end
end

class Pawn < Piece
    def initialize(pos, color, board)
        @symbol = :pawn
        super
    end
end

#--------------------------
