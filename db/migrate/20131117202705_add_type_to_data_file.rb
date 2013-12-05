class AddTypeToDataFile < ActiveRecord::Migration
  def change
    add_column :data_files, :type, :string
  end
end
