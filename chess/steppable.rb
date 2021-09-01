module Steppable

  def moves
    array = []
    origin = self.pos
    x, y = origin.first, origin.last

    self.move_diffs.each do |diff|

      dx, dy = diff.first, diff.last
      new_pos = [x + dx, y + dy]

      #in bounds check
      if new_pos.all? { |coord| coord.between?(0,7) }
        if self.board[new_pos].instance_of?(NullPiece) #empty?
          array << new_pos
        elsif  self.board[new_pos].color != self.color
          array << new_pos
        end 
      end
    end

    array
      
  end

  def move_diffs
    raise "You forgot to implement me!!!"
  end

end # End Steppable Module