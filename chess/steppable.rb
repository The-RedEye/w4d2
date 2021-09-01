module steppable

  def moves
    array = []
    origin = self.pos
    x, y = origin.first, origin.last

    @@Move_Diffs.each do |diff|

      dx, dx = diff.first, diff.last
      new_pos = [x + dx, y + dy]

      if #in bounds
        if #empty?
          ADD TO Array
        if  #opponent
          ADD TO Array
        else
      end

      



      # is position out of bounds?
      if new_pos.any? { |coord| !coord.between?(0,7) }
      # is position a null piece?
      elsif self.board[new_pos].instance_of?(NullPiece) # ??
          array << new_pos
          origin = new_pos
      # if position is a piece, is it the same color as us?
      elsif self.board[new_pos].color == self.color
      # if not, it is an opponsing piece
      else
      end
  end

  def move_diffs
    raise "You forgot to implement me!!!"
  end

end # End Steppable Module