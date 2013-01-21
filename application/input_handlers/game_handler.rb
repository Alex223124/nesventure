module InputHandlers
  module GameHandler

    def button_down(id)
      case id
      when Gosu::KbEscape
        close
      when Gosu::KbSpace
        obj = @game.objects.select {|x| x.id == "player"}.first
        obj['on_ground'] = false
        obj['y_momentum'] = -15
      when Gosu::KbLeft
        @game.keys['left'] = true
        obj = @game.objects.select {|x| x.id == "player"}.first
        obj['actively_moving'] = true
      when Gosu::KbRight
        @game.keys['right'] = true
        obj = @game.objects.select {|x| x.id == "player"}.first
        obj['actively_moving'] = true
      end
    end

    def button_up(id)
      case id
      when Gosu::KbLeft
        @game.keys['left'] = false
        obj = @game.objects.select {|x| x.id == "player"}.first
        obj['actively_moving'] = false
      when Gosu::KbRight
        @game.keys['right'] = false
        obj = @game.objects.select {|x| x.id == "player"}.first
        obj['actively_moving'] = false
      end
    end

  end
end