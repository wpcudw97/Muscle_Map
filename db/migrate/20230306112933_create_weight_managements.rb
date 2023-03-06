class CreateWeightManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :weight_managements do |t|
      t.integer :user_id, null: false
      t.float :weight, null: false
      t.timestamps
    end
  end
end