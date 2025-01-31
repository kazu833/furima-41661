# テーブル設計

## usersテーブル
 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :record



## itemsテーブル
 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name         | string | null: false |
| description       | text   | null: false |
| category_id          | integer | null: false |
| condition_id         | integer | null: false |
| shipping_cost_burden_id | integer | null: false |
| prefecture_id     | integer | null: false |
| shipping_days_id  | integer | null: false |
| price             | integer | null: false |
| user              | references | null: false, foreign_key: true |

### Association
- has_one :record
- belongs_to :user



## recordsテーブル

 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :information


## informationテーブル

 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code       | string | null: false, foreign_key: true |
| prefecture_id     | integer | null: false, foreign_key: true |
| city              | text   | null: false, foreign_key: true |
| street            | string | null: false, foreign_key: true |
| building          | string | null: true, foreign_key: true |
| phone_number      | string | null: false, foreign_key: true |

### Association
- belongs_to :record
