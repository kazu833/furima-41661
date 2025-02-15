class Shipping_cost_burden < ActiveHash::
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, name: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :articles
  validates :shipping_cost_burden_id, numericality: { other_than: 1 , message: "can't be blank"}

end