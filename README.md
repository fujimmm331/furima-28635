# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
has_one  :profile
has_many :products
has_many :purchases
has_many :comments
has_many :favorites
has_many :cards
has_many :delivery_informations

## profiles テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| nickname         | string     | null: false                   |
| family_name      | string     | null: false                   |
| first_name       | string     | null: false                   |
| kana_family_name | string     | null: false                   |
| kana_first_name  | string     | null: false                   |
| birth_year       | integer    | null: false                   |
| birth_month      | integer    | null: false                   |
| birth_day        | integer    | null: false                   |
| user             | references | null: false,foreign_key: true |

### Association
belongs_to :user


## products テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| explanation | text       | null: false                   |
| price       | integer    | null: false                   |
| category    | string     | null: false                   |
| condition   | string     | null: false                   |
| user        | references | null: false,foreign_key: true |

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
| purchase | boolean    | null: false                    |
| user     | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |

### Association
has_one    :card
has_one    :delivery_information
belongs_to :user
belongs_to :product


## delivery_informations テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | integer    | null: false                   |
| prefecture       | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     | null: false                   |
| telephone_number | integer    | null: false                   |
| user             | references | null: false,foreign_key: true |
| purchase         | references | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :purchase


## cards テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| credit_card_number | integer    | null: false                   |
| limit_month        | integer    | null: false                   |
| limit_year         | integer    | null: false                   |
| security_code      | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |
| purchase           | references | null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :purchase