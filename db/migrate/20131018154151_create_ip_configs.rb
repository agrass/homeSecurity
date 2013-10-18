class CreateIpConfigs < ActiveRecord::Migration
  def change
    create_table :ip_configs do |t|
      t.string :ip

      t.timestamps
    end
  end
end
