class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.string :comment, null: false
      t.timestamps
    end
  end
end
