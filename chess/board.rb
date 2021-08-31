require_relative "piece.rb"

class Board

    PAWN_ROW = Array.new(8) { Piece.new(:pawn) }
    WHITE_RANK_ROW = [
        Piece.new(:rook),
        Piece.new(:knight),
        Piece.new(:bishop),
        Piece.new(:queen),
        Piece.new(:king),
        Piece.new(:bishop),
        Piece.new(:knight),
        Piece.new(:rook)
    ]
    BLACK_RANK_ROW = [
        Piece.new(:rook),
        Piece.new(:knight),
        Piece.new(:bishop),
        Piece.new(:king),
        Piece.new(:queen),
        Piece.new(:bishop),
        Piece.new(:knight),
        Piece.new(:rook)
    ]
    NULL_ROW = Array.new(8) #{ NullPiece.new }

    def self.reset(board)
        board.each_with_index do |row, i|
            if i == 0
                board[i] = WHITE_RANK_ROW
            elsif i == 1 || i == 6
                board[i] = PAWN_ROW
            elsif i.between?(2,5)
                board[i] = NULL_ROW
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
b = Board.new