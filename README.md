#テーブル設計


## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| nickname              | string | null: false |
| lastname              | string | null: false |
| firstname             | string | null: false |
| lastname_kana         | string | null: false |
| firstname_kana        | string | null: false |
| birth_date            | date   | null: false |

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
| addtax_price       | integer    | null: false                   |
| profit             | integer    | null: false                   |
| soldout_sign       | integer    | null: false, default:"0"      |
| user               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | integer    | null: false                    |
| addresses          | integer    | null: false                    |
| building           | integer    |                                |
| phone              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item