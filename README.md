# アプリ名
Have a nice trip!

# アプリURL

# 一言で言うとどんなアプリか
旅行をより良いものにして次に旅行へのモチベーションへ繋げるアプリ


# どんな機能があるのか
・ユーザー登録/ログイン  
・トップページから全ての機能に遷移することができる  
・マイページでユーザーが作成した旅行プラン・行きたい場所リスト・フォトブック一覧を確認できる  
・旅行のプランを代替案も含めて立てる機能（日程未定と日程が決まっているもので別のページに保存できる）  
・行きたい場所リストとしてリストアップができる。  
・グループで旅行のプランを共有・編集できる機能  
・フォトブック作成機能  
・持ち物リストで忘れ物がないか確認できる  
・お土産リストを作成できる  
・PDFでダウンロードできる機能  
・行きたい場所リストで気になる場所に投票（もしくはエモーション）することができる  

（・メモ機能）  
（・検索機能）  
（・URL貼り付け機能）  
（・各種機能説明）  

# 誰のどんな問題を解決するのか
・未定であっても旅行計画を立てることができる。  
・代替案を追記して不測の事態に対処する。  
・行きたい場所候補をリストとして保存することができる。  
・リストアップした場所にいいねのような投票機能がある。（優先順位を決められる）  
・グループで旅行計画を編集することができる。  
・持ち物リストで忘れ物がないかチェックできる  
・お土産リストで買い忘れを防げる  
・フォトブックを作成することができる。  

# アプリを作った背景/きっかけ/ストーリー
余裕を持って旅行の計画が立てらなくて時間を無駄にしてしまう。  
グループLINEで旅行の計画を立てようとしても中々決まらない。  
せっかくの旅行なのに勿体無い部分が出てしまうことが多いので、旅行をもっと楽しむサポートができるアプリを作りたいと思った。  
フォトブック作成機能を設けることで旅行の後も楽しかった思い出を振り返り、共有できることで次の旅行へのモチベーションにつなげたい。


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique |
| encrypted_password | string | null: false |
| nickname           | string | null: false |


### Association
- has_many :itineraries
- has_many :lists
- has_many :prepares
- has_many :souvenirs
- has_many :records


## itineraries テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| location | string     | null: false |
| date     | date       |             |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :plans

## plans テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| icon_id   | integer    | null: false |
| time      | string     |             |
| content   | text       | null: false |
| itinerary | references | null: false, foreign_key: true |

### Association
- belongs_to :itinerary

## lists テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| sightseeing | string     | null: false |
| user        | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_many :spots

## spots テーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| suggestion | text | null: false |
| list | references | null: false, foreign_key |

### Association
- belongs_to :list

## prepares テーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| item | string | null: false |
| user        | references | null:false, foreign_key: true |

### Association
- belongs_to :user

## souvenirs テーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| who | string | null: false |
| user        | references | null:false, foreign_key: true |

### Association
- belongs_to :user

## records テーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null: false |
| user        | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_many :memories

## memories テーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| comment | string |  null: false|
| record | references | null:false, foreign_key: true |

### Association
-belongs_to :record