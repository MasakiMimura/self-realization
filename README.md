# アプリの目的
Rubyの問題文をクイズ形式で出し合い理解を深めるアプリケーション。
単語帳のように気軽に使う事ができ、覚えて置きたいメソッドや型を隙間時間に学習するができます。

# 作成の背景

学習効率をあげるには<アウトプット>が重要と理解しています。
自身で学んだ内容を考えて投稿する事で知識が定着し、学習効率をアップさせるだけでなく、他ユーザーが投稿した問題を回答する事で、知識の向上も期待できます。


# アプリケーション情報
- 問題を投稿し共有できるサイトを作成しました
- テスト用アカウント等
- ログイン情報
- ログイン用メールアドレス: aaa@aaa
- パスワード:  123456

# 開発環境
- Ruby/Ruby on Rails/MySQL/Github/AWS/visual studio code



# アプリの機能
- ユーザーの新規登録、ログイン,編集、削除機能
- 問題を(選択式)または(記述式)を選び投稿、削除、編集機能
- 投稿された問題の種別に合わせて回答機能
- 投稿された問題に対してのいいね機能
- 投稿された問題に対してコメント機能
- 検索機能
- 投稿された問題の正答率、回答数表示機能
- 不適切な問題の報告機能（違反者通告機能）
- レスポンシブ対応(headerや一覧表示など)

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
- has_many :introductions
- has_many :books
- has_many :times
- has_many :posts

## introductionsテーブル
|text|text|null: false|
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


## booksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|rank|integer|
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
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
