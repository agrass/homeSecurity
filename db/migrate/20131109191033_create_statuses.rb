class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :tipo
      t.integer :status

      t.timestamps
    end
  end
end
