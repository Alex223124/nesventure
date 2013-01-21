require 'behaviors/locationable'

module Movable

  include ::Locationable

  def initialize(*args)
    super(*args)
    self['x_momentum'] ||= 0
    self['y_momentum'] ||= 0
    self['on_ground'] ||= true
    on_tick do
      momentum_move
    end
  end

  def momentum_move
    check_collisions
    self['x'] += self['x_momentum']
    self['y'] += self['y_momentum']
    apply_friction unless self['actively_moving']
  end

  def check_collisions
    # TODO
    # actually implement this
    if (self['y'] + (self['y_momentum']) > @game.space_height - self['height'])
      self['y'] = @game.space_height - self['height']
      self['y_momentum'] = 0
      self['on_ground'] = true
    end
  end

  def apply_friction
    # TODO
    # if we're on ground, x_momentum drops off quickly, in air, more slowly
    # if we're on ground, y_momentum becomes 0 (if it was negative before)
    # etc...

    # dealing with x_momentum
    k = (self['on_ground'] ? Constants::ON_GROUND_FRICTION : Constants::IN_AIR_FRICTION)
    change = self['x_momentum'] * k
    if (change.abs < 1.0)
      self['x_momentum'] = 0
    else
      self['x_momentum'] = self['x_momentum'] * k
    end
  end

end