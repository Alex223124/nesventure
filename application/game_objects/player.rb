class Player < GameObject

  include Gravity

  def initialize(*args)
    super(*args)
    self['max_speed'] = 10
    on_tick do
      deal_with_input
    end
  end

  def deal_with_input
    if (@game.keys['left'])
      op = -1
    end
    if (@game.keys['right'])
      op = 1
    end
    if (@game.keys['right'] || @game.keys['left'])
      k = (self['on_ground'] ? Constants::ON_GROUND_FRICTION : Constants::IN_AIR_FRICTION)
      new_momentum = self['x_momentum'] + (self['max_speed'] * k * op)
      if (new_momentum.abs > self['max_speed'])
        self['x_momentum'] = self['max_speed'] * op
      else
        self['x_momentum'] = new_momentum
      end
    end
  end

end