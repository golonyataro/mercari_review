# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|number_of_exhibit|integer|
|phone_number|integer|
### Association
- has_one :evaluations, :dependent => :destroy
- has_one :credit_card, :dependent => :destroy
- has_many :adresses, :dependent => :destroy
- has_one :point, :dependent => :destroy


## evaluations（評価）テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|good|integer|
|average|integer|
|bad|integer|
### Association
- belongs_to :user


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|credit_number|integer|null: false|
|expiration_date|integer|null: false|
|security_ code|integer|null: false|
### Association
- belongs_to :user


## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|prefectures|string|null: false|
|Municipalities|string|null: false|
|address|string|null: false|
|building_name|string|
### Association
- belongs_to :user
- belongs_to :item


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|sum|integer|
|expiration_date|string|null: false|
### Association
- belongs_to :user



## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category_large|string|
|category_medium|string|
|category_small|string|
|category_size|string|
### Association
- has_one :item


## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many :item



## exhibitors（出品者）テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shipping_cost|integer|
### Association
- belongs_to :user
- has_one :item


## buyers（購入者）テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shipping_cost|integer|
### Association
- belongs_to :user
- has_one :item



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|category|references|null: false, foreign_key: true|
|bland|references|foreign_key: true|
|exhibitor|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|name|string|null: false|
|image|string|null: false|
|explain|text|null: false|
|price|integer|null: false|
|nice|integer|null: false|
|status|string|null: false|
|shipping-which|string|null: false|
|shipping-day|string|null: false|
|shipping-method|string|null: false|
### Association
- belongs_to :category
- belongs_to :bland
- belongs_to :exhibitor
- belongs_to :buyer
- has_many :comments, :dependent => :destroy



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :item


## newsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|good|integer|
|bad|integer|
### Association




* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...