class CreateDeviceLogs < ActiveRecord::Migration
  def change
    create_table :device_logs do |t|
      t.string :tipo
      t.integer :device_id
      t.string :value

      t.timestamps
    end
  end
end
