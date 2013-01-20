require File.join([APPLICATION_DIR, 'game_object'])
class Game

  attr_accessor :objects

  def initialize(state_name = 'default')
    load_game_state(state_name)
  end

  def load_game_state(state_name)
    full_json = File.open(File.join([STATE_DIR, "#{state_name}.json"]), 'r') {|f| f.read}
    state_hash = JSON.parse(full_json)

    @objects = load_game_objects(state_hash['game_objects'])
  end

  def tick
    # TODO
    # update game logic.  This will run 60 times per second regardless of frame-rate
    @objects.each do |obj|
      obj.tick
    end
  end


  private

  def load_game_objects(objects_hash)
    result = []
    objects_hash.each do |object_id, object_info|
      result << GameObject.new(object_id, object_info)
    end
    result
  end

end