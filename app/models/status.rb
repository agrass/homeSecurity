class Status < ActiveRecord::Base
  attr_accessible :status, :tipo, :verify
  module Estados
    Activated = 1
    Desactivated = 2
  end
  module Tipo
    Camera = 1
    Gas = 2
    Sensor = 3
  end
  module Verify
    yes = 1
    no = 2
  end

  def self.removeALL
    Status.destroy_all
  end
  def self.activate(params)
  end
end
