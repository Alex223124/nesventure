# basically, just ensure that things like x, y, width, and height are set
module Locationable

  def initialize(*args)
    super(*args)
    self['x'] ||= 0
    self['y'] ||= 0
    self['width'] ||= 0
    self['height'] ||= 0
  end

end