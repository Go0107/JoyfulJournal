# 設計
## 業務フロー
#### トップ画面
* ログインボタンを押す → ログインへ遷移
* 新規登録ボタンを押す → 新規登録画面へ遷移

#### ログイン画面
* メールアドレス、パスワードを入力し、ログインボタンを押す → ログインし、日記投稿画面へ遷移
* メールアドレス、パスワードを入力し、ログインボタンを押す（日記投稿済み） → 日記一覧画面へ遷移

#### ヘッダー
* 日記一覧ボタンを押す → 日記一覧画面へ遷移
* 日記投稿ボタンを押す → 日記投稿画面へ遷移
* 幸福度グラフボタンを押す → 幸福度グラフ画面へ遷移
* ログアウトボタンを押す → ログアウトし、トップ画面へ遷移

#### 日記一覧画面
* 削除ボタンを押す → 日記が削除される

#### 日記投稿画面
* スタンプを選択、日記を入力し、投稿ボタンを押す → 日記が投稿され、日記一覧画面へ遷移

#### 幸福度グラフ画面
* グラフが表示されるのみ
## 画面遷移図
https://www.figma.com/design/oslG8QuctbXG5c01WIfMHa/オリプロ%E3%80%80画面遷移図?node-id=0-1&t=tSqyitwRLtuNUNyd-0
## ワイヤーフレーム
https://www.figma.com/design/pYyMoOUk6togTRpK8RdOpw/ワイヤーフレーム?node-id=0-1&t=D9JhOLmIBpE5phgc-0
## テーブル定義書
### users
|項目名|データ型|初期値|必須|主キー|
|:--|:--|:--|:--|:--|
|id|BIGINT||TRUE|TRUE|
|name|VARCHAR||TRUE||
|email|VARCHAR||TRUE||
|password|VARCHAR||TRUE||
|created_at|TIMESTAMP|CURRENT_TIMESTAMP|TRUE||
|updated_at|TIMESTAMP|CURRENT_TIMESTAMP|TRUE||
### journals
|項目名|データ型|初期値|必須|主キー|
|:--|:--|:--|:--|:--|
|id|BIGINT||TRUE|TRUE|
|content|VARCHAR||||
|stamp|VARCHAR||TRUE||
|created_at|TIMESTAMP|CURRENT_TIMESTAMP|TRUE||
|updated_at|TIMESTAMP|CURRENT_TIMESTAMP|TRUE||
## システム構成図
![システム構成図](infrastructure.png)