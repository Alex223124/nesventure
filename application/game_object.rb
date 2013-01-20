class GameObject

  attr_reader :id

  def initialize(id, object_info, game)
    @id = id

    # game objects have a reference to @game for global information like map_info and such
    @game = game
    @tickers = []
    load_from_hash(object_info)
  end

  def tick
    @tickers.each do |proc|
      proc.call
    end
  end

  def [](attribute)
    @attributes[attribute.to_s]
  end

  def []=(attribute, value)
    @attributes[attribute.to_s] = value
  end

  def on_tick(&block)
    @tickers << block
  end

  private

  def load_from_hash(object_info)
    @attributes ||= {}
    object_info['attributes'].each do |key, value|
      if value == 'true'
        @attributes[key] = true
      elsif value == 'false'
        @attributes[key] = false
      else
        @attributes[key] = value
      end
    end
  end

end