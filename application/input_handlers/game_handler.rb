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
      end
    end

    def button_up(id)

    end

  end
end