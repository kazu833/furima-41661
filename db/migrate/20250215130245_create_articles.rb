class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
