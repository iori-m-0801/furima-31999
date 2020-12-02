# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first         | string | null: false               |
| kana_last          | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :shoppings

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| money         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belong_to :user
- has_one :shopping

## shoppings テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belong_to :user
- has_one :address
- has_one :item

## addresses テーブル

| Column        | Type        | Options     |
| ------------- | ----------- | ----------- |
| postal_code   | string      | null: false |
| prefecture_id | integer     | null: false |
| city          | string      | null: false |
| city_number   | string      | null: false |
| building      | string      |
| tel           | string      | null: false |
| user          | references  | null: false, foreign_key: true |

### Association
- belong_to :shopping