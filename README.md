# テーブル設計

## usersテーブル
 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_one :record
- has_many :comments



## itemsテーブル
 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name         | string | null: false |
| description       | text   | null: false |
| category          | string | null: false |
| condition         | string | null: false |
| shipping_cost_burden | string | null: false |
| shipping_origin_region | string | null: false |
| shipping_days     | string | null: false |
| user              | references | null: false, foreign_key: true |

### Association
- has_one :record
- belongs_to :user
- has_many :comments



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
| postal_code       | string | null: false |
| prefecture        | string | null: false |
| city              | text   | null: false |
| street            | string | null: false |
| building          | string | null: true |
| phone_number      | string | null: false |

### Association
- belongs_to :record



## commentsテーブル

 Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text   | null: false |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item