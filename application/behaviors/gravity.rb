require 'behaviors/movable'

module Gravity

  include ::Movable

  def initialize(*args)
    super(*args)
    on_tick do
      gravity_tick
    end
  end

  def gravity_tick
    # super-naive proof-of-concept of module ticking
    # self['y'] += 1
    # self['y'] = 0 if self['y'] > @game.space_height
    unless (self['on_ground'])
      self['y_momentum'] += Constants::GRAVITY
    end
  end
end