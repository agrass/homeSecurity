class DeviceLog < ActiveRecord::Base
  attr_accessible :device_id, :tipo, :value

  def self.setLog(id, t, v)
      DeviceLog.create(:device_id => id, :tipo => t, :value => v )
  end
end
