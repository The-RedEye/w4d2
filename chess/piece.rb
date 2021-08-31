
class NullPiece < Piece

    def initialize
    end
    
end #End NullPiece Class

module Slideable
    HORIZONTAL_DIRS =[]
    DIAGONAL_DIRS = []
    

    def horizontal_dirs #rook.horizontal_dirs
       origin = self.position
    end

    def diagonal_dirs
    end

end


#---------------------------

class Piece
    attr_reader :value, :color
    def initialize(value, color)
        @value = value
        @color = color
    end

    def moves
        result = []

        result 
    end

end # End Piece Class

class Rook < Piece
    attr_reader :symbol
    include Slideable
    def initialize
        @symbol = :rook
    end
end

class Bishop < Piece
    include Slideable

    def initialize
        @symbol = :bishop
    end
end

class Queen < Piece
    include Slideable

    def initialize
        @symbol = :queen
    end
end

class Knight < Piece
    def initialize
        @symbol = :knight
    end
end

class King < Piece
    def initialize
        @symbol = :king
    end
end

class Pawn < Piece
    def initialize
        @symbol = :pawn
    end
end

#--------------------------
