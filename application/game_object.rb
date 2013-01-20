class GameObject

  def initialize(id, object_info)
    @id = id
    load_from_hash(object_info)
  end

  def tick
  end

  def [](attribute)
    @attributes[attribute.to_s]
  end

  private

  def load_from_hash(object_info)
    @attributes = object_info['attributes']
  end

end