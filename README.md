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

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| item_name        | string     | null: false  |
| description      | text       | null: false  |
| detail_category  | date       | null: false  |
| detail_status    | date       | null: false  |
| delivery_fee     | date       | null: false  |
| delivery_area    | date       | null: false  |
| delivery_day     | date       | null: false  |
| price            | string     | null: false  |
| user             | references |              |
| purchase_history | references |              |


### Association
- belongs_to :users
- belongs_to :purchase_histories
- has_many :comments

## commentsテーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| text             | text       | null: false  |  
| user             | references |              |
| item             | references |              |
| purchase_history | references |              |


### Association
- belongs_to :users
- belongs_to :items

## purchase_historiesテーブル

| Column    | Type       | Options      |
| --------- | ---------- | ------------ |
| user      | references |              |


### Association
- has_many :items
- belongs_to :users
- has_one :addresses

## addressesテーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| post_number      | string     | null: false  |
| prefectures      | date       | null: false  |
| city             | string     | null: false  |
| house_number     | string     | null: false  |
| building         | string     |              |
| phone_number     | string     | null: false  |