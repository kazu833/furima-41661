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
- has_many :records



## itemsテーブル
 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name         | string | null: false |
| description       | text   | null: false |
| category_id          | integer | null: false |
| condition_id         | integer | null: false |
| shipping_cost_burden_id | integer | null: false |
| prefecture_id     | integer | null: false |
| shipping_day_id  | integer | null: false |
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


## informationsテーブル

 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code       | string | null: false |
| prefecture_id     | integer | null: false |
| city              | string | null: false |
| street            | string | null: false |
| building          | string |              |
| phone_number      | string | null: false |
| record             | references | null: false, foreign_key: true |

### Association
- belongs_to :record
