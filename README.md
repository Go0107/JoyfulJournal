# JoyfulJournal
日記アプリ『JoyfulJournal』は、自分の感情を見える化し、幸福度を管理するためのパーソナル日記アプリです。日々の感情を記録し、自己認識を深めるための実践的なツールを提供します。あなたの心の状態を視覚的に把握し、より良い生活を送るための手助けをします。
#### サービスURL
https://joyfuljournal.online/
## アプリイメージ
|トップページ|日記投稿|
|---|---|
|![トップページ](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88+2024-07-13+030318.png)|![日記投稿](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/%E6%97%A5%E8%A8%98%E6%8A%95%E7%A8%BF.png)|

|日記一覧|幸福度グラフ|
|---|---|
|![日記一覧](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/%E6%97%A5%E8%A8%98%E4%B8%80%E8%A6%A7.png)|![幸福度グラフ](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com%E5%B9%B8%E7%A6%8F%E5%BA%A6%E3%82%B0%E3%83%A9%E3%83%95%EF%BC%92.png)|
#### キャラクター
|日記未投稿|元気スタンプ投稿|憂鬱スタンプ投稿|
|---|---|---|
|![noentry](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/sample-noentry-character.png)|![fine](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/sample-fine-character.png)|![depressed](https://joyfuljournal-bucket.s3.ap-northeast-1.amazonaws.com/sample-depressed-character.png)|
## 機能一覧
* 新規登録、ログイン機能
* ログアウト機能
* 日記投稿機能(スタンプの選択と日記の記入ができる)
* 日記一覧機能(投稿日時、投稿内容、スタンプの表示)
* 日記削除機能
* キャラクター機能(画像とセリフの表示)
* 幸福度グラフ機能

## 使用技術
* フロントエンド
  * HTML/CSS
  * Javascript
* バックエンド
  * Ruby 3.2.2
  * Ruby on Rails 7.0.8
* インフラ
  * AWS(EC2,VPC,ALB,RDS,S3,Route53,ACM)
  * Nginx
  * Unicorn
## ER図
![ER図](./documents/er.png)
## インフラ構成図
![インフラ構成図](./documents/infrastructure.png)
## 工夫した点
<!-- * 使いやすく、シンプルなインターフェイス。
* ログイン後に当日の日記投稿の精査によって遷移画面が変わる仕組み。
* 一覧画面でのキャラクター表示（その日のスタンプによってコメントが変わる）。
* バリデーションが整っていて、スタンプを選択しないと日記を投稿できない。 -->
#### キャラクター機能
日記一覧画面の右下にキャラクターを用意しました。当日の日記の幸福度でキャラクターの表情、セリフが変化し、共感してくれたり、励ましてくれたりします。
#### 幸福度グラフ
日々の幸福度をグラフ化しました。日記のスタンプで得られた幸福度をグラフ化することにより、過去の自分を客観的に見ることができます。
#### ログイン後の遷移画面
ログイン後に当日の日記投稿の精査によって遷移画面を変化するようにしました。未投稿のときは日記投稿画面、投稿済みのときは日記一覧画面に遷移します。
#### バリデーション
バリデーションが整っていて、スタンプを選択しないと日記を投稿できないようにしました。敢えて日記を記入しなくても投稿できるようにして、日記を書く時間がないときや面倒なときに、スタンプのみで簡単に投稿できるようにしました。