# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| password           | string  | null: false |
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | string  | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| image                | string     | null: false                    |
| product_name         | string     | null: false                    |
| product_description  | string     | null: false                    |
| category             | string     | null: false                    |
| status_id            | string     | null: false                    |
| invoice_price        | string     | null: false                    |
| invoice_territory    | string     | null: false                    |
| days_to_delivery     | string     | null: false                    |
| product_price        | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| card_expiry_month  | string     | null: false                    |
| card_expiry_year   | string     | null: false                    |
| card_cvc           | string     | null: false                    |
| postal_code        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| city               | text       | null: false                    |
| block              | text       | null: false                    |
| building           | text       | null: false                    |
| phone_number       | string     | null: false                    |
| user               | string     | null: false, foreign_key: true |
| items              | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user