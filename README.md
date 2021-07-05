## usersテーブル

| Column              | Type       | Options                    |
| ------------------- | ---------- | -------------------------- |
| nickname            | string     | null: false                |
| email               | string     | null: false, unique: true  |
| encrypted_password  | string     | null: false                |
| family_name_zenkaku | string     | null: false                |
| first_name_zenkaku  | string     | null: false                |
| family_name_hurigana| string     | null: false                |
| first_name_hurigana | string     | null: false                |
| birthday            | date       | null: false                |


### Association
- has_many :items
- has_many :comments
- has_many:purchase_histories

## itemsテーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| name          | string     | null: false  |
| description        | text       | null: false  |
| detail_category_id | integer    | null: false  |
| detail_status_id   | integer    | null: false  |
| delivery_fee_id    | integer    | null: false  |
| delivery_area_id   | integer    | null: false  |
| delivery_day_id    | integer    | null: false  |
| price              | integer    | null: false  |
| user               | references |              |


### Association
- belongs_to :user
- has_one :purchase_histories
- has_many :comments

## commentsテーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| text             | text       | null: false  |  
| user             | references |              |
| item             | references |              |
| purchase_history | references |              |


### Association
- belongs_to :user
- belongs_to :item

## purchase_historiesテーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| post_number      | string     | null: false       |
| delivery_area_id | integer    | null: false       |
| city             | string     | null: false       |
| house_number     | string     | null: false       |
| building         | string     |                   |
| phone_number     | string     | null: false       |
| purchase_history | references | foreign_key: true |

### Association
- belongs_to :purchase_history