require_relative "piece.rb"

class Board

    WHITE_PAWN_ROW = Array.new(8) { Piece.new(:pawn, :white, self) }

    BLACK_PAWN_ROW = Array.new(8) { Piece.new(:pawn, :black, self) }
    
    WHITE_RANK_ROW = [
        Rook.new([0,0], :white, self),
        Knight.new([0,1], :white, self),
        Bishop.new([0,2], :white, self),
        Queen.new([0,3], :white, self),
        King.new([0,4], :white, self),
        Bishop.new([0,5], :white, self),
        Knight.new([0,6], :white, self),
        Rook.new([0,7], :white, self)
    ]
    BLACK_RANK_ROW = [
        Rook.new([7, 0], :black, self),
        Knight.new([7, 1], :black, self),
        Bishop.new([7, 2], :black, self),
        King.new([7, 3], :black, self),
        Queen.new([7, 4], :black, self),
        Bishop.new([7, 5], :black, self),
        Knight.new([7, 6], :black, self),
        Rook.new([7, 7], :black, self)
    ]

    def self.reset(board)
        board.each_with_index do |row, i|
            if i == 0
                board[i] = WHITE_RANK_ROW
            elsif i == 1
                board[i] = WHITE_PAWN_ROW
            elsif i.between?(2,5)
                board[i] = Array.new(8, NullPiece.instance)
            elsif i == 6
                board[i] = BLACK_PAWN_ROW
            else
                board[i] = BLACK_RANK_ROW
            end
        end
        board
    end
    
    
    def initialize
        @board = Array.new(8) { Array.new(8) }
        @board = Board.reset(@board)
    end

    def move_piece(start_pos, end_pos)
        raise "start position is not valid" unless start_pos.all? { |pos| pos.between?(0,7) }
        raise "end position is not valid" unless end_pos.all? { |pos| pos.between?(0,7) }
        raise "there is no piece at start_pos" unless self[start_pos].instance_of?(Piece)
    
        self[end_pos] = self[start_pos]
        self[start_pos] = nil #NullPiece.new
        self[end_pos]

    end

    def [](pos) 
        row , col = pos
        @board[row][col]
    end

    def []=(pos, piece)
        row , col = pos
        @board[row][col] = piece
    end



end
