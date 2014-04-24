class AddKeyToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :key, :string
  end
end
