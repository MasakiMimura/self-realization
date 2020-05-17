# アプリの目的
自己のやりたいことを実現するためのアプリケーションです。

# 作成の背景
自己肯定感を高めるために日々の努力の結果、やるべきことを登録することが必要です。
また、人間は意志が弱いため、価値観が同じ仲間との出会いを生むために、自分の好きなものや、習慣、何を占めているかを登録します。

# アプリケーション情報
- 自分のやりたいことを実現するまでを記録できるサイトを作成しました
- テスト用アカウント等
- ログイン情報
- ログイン用メールアドレス: mimura@masaki.com
- パスワード: mimura36

# 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/visual studio code

# アプリの機能
- ユーザーの新規登録、ログイン,編集機能 
- 円グラフの作成
- 自分の好きなものを登録するお気に入り機能
- 投稿された内容をカレンダーに投稿する機能
- 投稿された問題に対してのいいね機能
- 投稿された問題に対してコメント機能

# アプリ未完成
- 画面遷移をしないように機能を追加・バージョンアップ中
- 画像ファイルのプレビュー機能
- レスポンシブ対応(左右のコンテンツの表示など)

# DBの設計
## usersテーブル deviseを使用
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|
|image|string||

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text||
|email|string|null: false|
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
