APPLICATION_DIR = File.join(['.', 'application'])
RENDERER_DIR = File.join(['.', 'renderer'])
STATE_DIR = File.join(['.', 'game_states'])

require 'gosu'
require 'json'
require 'debugger'

$LOAD_PATH.unshift(File.expand_path(APPLICATION_DIR))
$LOAD_PATH.unshift(File.expand_path(RENDERER_DIR))
Dir[File.join([APPLICATION_DIR, '**', '*.rb'])].each{ |f| require f }
Dir[File.join([RENDERER_DIR, '**', '*.rb'])].each{ |f| require f }

class GameWindow < Gosu::Window

  include InputHandlers::GameHandler

  def initialize
    super 1280, 800, false
    self.caption = "Nesventure Time!"
    @game = Game.new
    @game.space_width = 1280
    @game.space_height = 800
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
