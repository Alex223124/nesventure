class Game

  attr_accessor :objects, :space_height, :space_width, :keys

  def initialize(state_name = 'default')
    @keys = {}
    load_game_state(state_name)
  end

  def load_game_state(state_name)
    full_json = File.read(File.join([STATE_DIR, "#{state_name}.json"]))
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
      klass = object_info['class'] || 'GameObject'
      result << Utils.constantize(klass).new(object_id, object_info, self)
    end
    result
  end

end