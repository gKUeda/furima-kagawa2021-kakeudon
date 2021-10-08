#テーブル設計


## usersテーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| email                 | string | null: false               |
| encrypted_password    | string | null: false, unique: true |
| nickname              | string | null: false               |
| lastname              | string | null: false               |
| firstname             | string | null: false               |
| lastname_kana         | string | null: false               |
| firstname_kana        | string | null: false               |
| birth_date            | date   | null: false               |

### Association
- has_many  items
- has_many  orders

## itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| info               | text       | null: false                   |
| category_id        | integer    | null: false                   |
| salesstatus_id     | integer    | null: false                   |
| shippingfees_id    | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| delivery_id        | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery

## deliverysテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order