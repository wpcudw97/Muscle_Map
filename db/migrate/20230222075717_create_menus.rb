class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :menu_image
      t.timestamps
    end
  end
end
