# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items
- has_one :customer


## items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| item_name     | string      | null: false                    |
| text          | text        | null: false                    |
| price         | integer     | null: false                    |
| category      | string      | null: false                    |
| status        | string      | null: false                    |
| responsible   | string      | null: false                    |
| region        | string      | null: false                    |
| user_id       | references  | null: false, foreign_key: true |


### Association

- has_one :customer
- belongs_to :user

## customers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- has_one :areas
- belongs_to :user

## areas テーブル

| Column          | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| postal      | integer     | null: false |
| prefecture  | string      | null: false |
| city        | string      | null: false |
| city_num    | string      | null: false |
| building    | string      |             |
| tel_num     | integer     | null: false |

### Association

- belongs_to :customer