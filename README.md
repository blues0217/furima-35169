## usersテーブル

| Column    | Type       | Options      |
| --------- | ---------- | ------------ |
| nickname  | string     | null: false  |
| email     | string     | null: false  |
| password  | string     | null: false  |
| name      | string     | null: false  |
| birthday  |            | null: false  |


### Association
- has_many :items
- has_many :comments
- has_one:buyers

## itemsテーブル

| Column      | Type       | Options      |
| ----------- | ---------- | ------------ |
| image       |            | null: false  |
| item_name   | string     | null: false  |
| description | text       | null: false  |
| detail      |            | null: false  |
| delivery    |            | null: false  |
| price       |            | null: false  |
| user        | references |              |
| buyer       | references |              |


### Association
- belongs_to :users
- belongs_to :buyers
- has_many :comments

## commentsテーブル

| Column    | Type       | Options      |
| --------- | ---------- | ------------ |
| text      | text       | null: false  |  
| user      | references |              |
| item      | references |              |
| buyer     | references |              |


### Association
- belongs_to :users
- belongs_to :items
- belongs_to :buyers

## buyersテーブル

| Column    | Type       | Options      |
| --------- | ---------- | ------------ |
| card      |            | null: false  |
| adress    |            | null: false  |
| user      | references |              |


### Association
- has_many :items
- has_many :comments
- belongs_to :users