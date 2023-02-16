class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.float :rate, null: false, default: 0
      t.timestamps
    end
  end
end
