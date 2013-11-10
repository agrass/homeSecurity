class CreateGasSenses < ActiveRecord::Migration
  def change
    create_table :gas_senses do |t|
      t.float :value

      t.timestamps
    end
  end
end
