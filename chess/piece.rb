require_relative "slideable.rb"
require_relative "steppable.rb"


class Piece
    attr_reader :value, :color
    def initialize(value, color)
        @value = value
        @color = color
    end

    def moves
        result = []

        move_dirs

        result 
    end

end # End Piece Class


# -----------------------

class NullPiece < Piece

    def initialize
    end
    
end #End NullPiece Class


#---------------------------

class Rook < Piece
    attr_reader :symbol
    include Slideable
    def initialize
        @symbol = :rook
    end

    def move_dirs
        horizontal_dirs
    end


end

class Bishop < Piece
    include Slideable

    def initialize
        @symbol = :bishop
    end

    def move_dirs
        diagonal_dirs
    end
end

class Queen < Piece
    include Slideable

    def initialize
        @symbol = :queen
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
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
