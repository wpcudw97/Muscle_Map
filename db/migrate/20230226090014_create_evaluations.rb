class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.text :evaluation, null: false
      t.timestamps
    end
  end
end
