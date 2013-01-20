APPLICATION_DIR = File.join(['.', 'application'])
RENDERER_DIR = File.join(['.', 'renderer'])
STATE_DIR = File.join(['.', 'game_states'])
require 'gosu'
require 'json'
require File.join([APPLICATION_DIR, 'game'])
require File.join([RENDERER_DIR, 'gosu_renderer'])
require File.join([APPLICATION_DIR, 'constants'])

class GameWindow < Gosu::Window

  def initialize
    super 1280, 800, false
    self.caption = "Nesventure Time!"
    @game = Game.new
    @renderer = GosuRenderer.new(self, @game)
  end

  def update
    @game.tick
  end

  def draw
    @renderer.tick
    @renderer.draw
  end

end

gw = GameWindow.new
gw.show
