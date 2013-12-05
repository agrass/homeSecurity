class RenameColumAaaa < ActiveRecord::Migration
  def up
    rename_column :data_files, :type, :tipo
  end

  def down
  end
end
