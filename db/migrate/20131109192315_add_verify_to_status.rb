class AddVerifyToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :verify, :integer
  end
end
