FactoryBot.define do
  factory :record_information do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '京都府' }
    street { '1-1' }
    building { 'ハイツ' }
    phone_number { 11_122_223_333 }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_qwerasdf123456789' }
  end
end
