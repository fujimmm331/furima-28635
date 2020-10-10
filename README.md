# テーブル設計

## users テーブル

| Column           | Type               | Options                       |
| ---------------- | ------------------ | ----------------------------- |
| nickname         | string             | null: false                   |
| email            | string             | null: false, unique: true     |
| password         | encrypted_password | null: false                   |
| family_name      | string             | null: false                   |
| first_name       | string             | null: false                   |
| kana_family_name | string             | null: false                   |
| kana_first_name  | string             | null: false                   |
| birthday_id      | date               | null: false                   |

### Association
has_many :products
has_many :purchases
has_many :comments
has_many :favorites


## products テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| image              | string     | null: false                   |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| delivery_source_id | integer    | null: false                   |
| days_to_ship_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association
has_many   :comments
has_many   :favorites
has_one    :purchase
belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product


## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| favorite | boolean    | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product


## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association
has_one    :delivery_information
belongs_to :user
belongs_to :product


## delivery_informations テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     |                               |
| telephone_number | string     | null: false                   |
| purchase         | references | null: false,foreign_key: true |

### Association
belongs_to :purchase