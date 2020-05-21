# アプリの目的
自己のやりたいことを実現するためのアプリケーションです。

# 作成の背景
自己肯定感を高めるためには日々の努力の結果、やるべきことを登録することが必要です。
また、人間は意志が弱いため、価値観が同じ仲間との出会いが必要です。そのために自分の好きな本や習慣、自分が何を占めているかを登録します。

# アプリケーション情報
- 自分のやりたいことを実現するまでを記録できるサイトを作成しました
- url: https://self-realization.herokuapp.com/
- ログイン用メールアドレス: mimura@masaki.com
- パスワード: mimura36

# 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/visual studio code

# アプリの機能
- ユーザーの新規登録、ログイン,編集機能 
- 日々のルーティンを登録する機能
![result](https://user-images.githubusercontent.com/62504066/82596472-50478500-9be2-11ea-8312-8301452b6ff6.gif)
- ToDoリストを登録・完了（削除）する機能
![result](https://user-images.githubusercontent.com/62504066/82596548-6b19f980-9be2-11ea-8a2b-5df34fe05702.gif)
- お気に入りの書籍を登録する機能
![result](https://user-images.githubusercontent.com/62504066/82596582-7a00ac00-9be2-11ea-8038-35784645a41d.gif)
- 毎日の積み上げを登録する機能
![result](https://user-images.githubusercontent.com/62504066/82596614-8ab12200-9be2-11ea-8786-fab44b4fc615.gif)

# アプリ未完成
- 画像ファイルのプレビュー機能
- レスポンシブ対応(左右のコンテンツの表示など)
- 他のユーザーとの共有機能
- 投稿された積み上げに対して他のユーザーからのいいね機能

# DBの設計
## usersテーブル deviseを使用
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text||
|email|string|null: false|
|twitter|string||
|content|text||
|password|string|null: false|
### Association
- has_many :routines
- has_many :times
- has_many :favorites
- has_many :posts

## routinesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|turn|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## timesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|content|text||
|order|integer||
|run|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## favoritessテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|rank|integer||
|image|text||
|url|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## todosテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|image|text||
|start_time|datetime||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
