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
    NULL_ROW = Array.new(8) { NullPiece.new }

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
        raise "there is no piece at start_pos" if @board[start_pos[0]][start_pos[1]].instance_of?(NullPiece)
        raise "the piece cannot move to end_pos" unless end_pos.all? { |pos| pos.between?(0,7) }
    end



end