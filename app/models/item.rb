class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, null: false
  validates :description, null: false
  validates :category_id, null: false
  validates :condition_id, null: false
  validates :shipping_cost_burden_id, null: false
  validates :prefecture_id, null: false
  validates :shipping_day_id, null: false
  validates :price, null: false
  validates :user, null: false, foreign_key: true
  
end
