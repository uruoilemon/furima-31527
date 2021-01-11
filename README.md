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

### AssociationS
- has_many :items
- has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name 　　　      | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| price           | integer    | null: false                    |
| payment         | string     | null: false                    |
| prefecture_id   | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |

### Association
- belongs_to :item
- belongs_to :user
- has_one :shipping_data

## shipping_data

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| postal_code      | integer  | null: false |
| prefecture_id    | string   | null: false |
| Municipalities   | string   | null: false |
| address          | integer  | null: false |
| building         | string   | 　　　　　　  |
| telephone_number | integer  | null: false |

### Association
- belongs_to :order