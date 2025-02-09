FactoryBot.define do
  factory :user do
    email                 {'test@com'}
    password              {'test11'}
    password_confirmation {password}
    nickname              {'test'}
    last_name             {'てすと'}
    first_name            {'てすお'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスオ'}
    birthday              {'2000/10/10'}
  end
end