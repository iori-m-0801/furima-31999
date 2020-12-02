# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| mail       | string | null: false, unique: true |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| kana_first | string | null: false               |
| kana_last  | string | null: false               |
| birthday   | date   | null: false               |

### Association
- has_many :items
- has_many :shoppings

## items テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| item_name   | string  | null: false                    |
| explanation | text    | null: false                    |
| category    | string  | null: false                    |
| status      | string  | null: false                    |
| shipping    | string  | null: false                    |
| prefectures | string  | null: false                    |
| days        | date    | null: false                    |
| money       | integer | null: false                    |
| seller      | string  | null: false, foreign_key: true |

### Association
- belong_to :users
- has_one :shoppings

## shoppings テーブル

| Column    | Type   | Options                        |
| --------- | ------ | ------------------------------ |
| buyer     | string | null: false, foreign_key: true |
| when      | date   | null: false                    |
| buy_item  | string | null: false, foreign_key: true |

### Association
- belong_to :user
- has_one :address

## address

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| postal_code     | string | null: false |
| buy_prefectures | string | null: false |
| city            | string | null: false |
| city_number     | tex    | null: false |
| building        | text   |
| tel             | text   | null: false |

### Association
- has_one :shoppings
