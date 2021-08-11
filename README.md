# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| nickname           | string  | null: false                    |
| family_name        | string  | null: false                    |
| first_name         | string  | null: false                    |
| family_name_kana   | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| birth_date         | date    | null: false                    |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| product_description  | text       | null: false                    |
| category_id          | integer    | null: false                    |
| status_id            | integer    | null: false                    |
| invoice_price_id     | integer    | null: false                    |
| invoice_territory_id | integer    | null: false                    |
| days_to_delivery_id  | integer    | null: false                    |
| product_price        | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## address テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| invoice_territory_id | integer    | null: false                    |
| city                 | string     | null: false                    |
| block                | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### Association

- belongs_to :order