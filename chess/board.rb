require_relative "piece.rb"
require "byebug"

class Board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        @board = reset(@board)
    end

    def reset(board)

        normal_board_state

        # test_board_state

        board.each_with_index do |row, i|
            if i == 0
                board[i] = @white_rank_row
            elsif i == 1
                board[i] = @white_pawn_row
            elsif i.between?(2,5)
                board[i] = Array.new(8, NullPiece.instance)
            elsif i == 6
                board[i] = @black_pawn_row
            else
                board[i] = @black_rank_row
            end
        end
        board
    end

    def move_piece(start_pos, end_pos)
        raise "start position is not valid" unless start_pos.all? { |pos| pos.between?(0,7) }
        raise "end position is not valid" unless end_pos.all? { |pos| pos.between?(0,7) }
        raise "there is no piece at start_pos" unless self[start_pos].kind_of?(Piece)
    
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance

        #update positions on piece
        self[end_pos].pos = end_pos

    end

    def [](pos) 
        row , col = pos
        @board[row][col]
    end

    def []=(pos, piece)
        row , col = pos
        @board[row][col] = piece
    end

    private

    def test_board_state

        @white_pawn_row = Array.new(8, NullPiece.instance)

        @white_rank_row = [
            King.new([0,0], :white, self),
            NullPiece.instance,
            Queen.new([0,2], :white, self),
            NullPiece.instance,
            NullPiece.instance,
            NullPiece.instance,
            NullPiece.instance,
            NullPiece.instance
        ]

        @black_pawn_row = Array.new(8, NullPiece.instance)

        @black_rank_row = Array.new(8, NullPiece.instance)

    end

    def normal_board_state

        @white_pawn_row = []

        (0..7).each do |y|
            @white_pawn_row << Pawn.new([1, y], :white, self)
        end

        @black_pawn_row = []
        
        (0..7).each do |y|
            @black_pawn_row << Pawn.new([6, y], :black, self)
        end
    
        @white_rank_row = [
            Rook.new([0,0], :white, self),
            Knight.new([0,1], :white, self),
            Bishop.new([0,2], :white, self),
            Queen.new([0,3], :white, self),
            King.new([0,4], :white, self),
            Bishop.new([0,5], :white, self),
            Knight.new([0,6], :white, self),
            Rook.new([0,7], :white, self)
        ]


        @black_rank_row = [
            Rook.new([7, 0], :black, self),
            Knight.new([7, 1], :black, self),
            Bishop.new([7, 2], :black, self),
            King.new([7, 3], :black, self),
            Queen.new([7, 4], :black, self),
            Bishop.new([7, 5], :black, self),
            Knight.new([7, 6], :black, self),
            Rook.new([7, 7], :black, self)
        ] 

    end



end
