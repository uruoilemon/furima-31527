# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name 　　　      | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| price           | integer    | null: false                    |
| payment_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_data

## shipping_data

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order