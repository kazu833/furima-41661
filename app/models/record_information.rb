class RecordInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :record_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(item_id: item_id,user_id: user_id)
    
    Information.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number,record_id: record.id)
  end
end